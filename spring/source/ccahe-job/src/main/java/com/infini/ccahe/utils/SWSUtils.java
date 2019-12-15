package com.infini.ccahe.utils;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import javax.xml.namespace.QName;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;

import com.infini.ccahe.dto.BargainFinderMaxRQDto;
import com.infini.ccahe.dto.SessionCloseRQDto;
import com.infini.ccahe.dto.SessionCreateRQDto;

public class SWSUtils {
	private static final String XML_PASSENGER_QUANTITY = "<PassengerTypeQuantity Code=\"ADT\" Quantity=\"{{number}}\" ><TPA_Extensions><VoluntaryChanges Match=\"Info\" /></TPA_Extensions></PassengerTypeQuantity>";
	private static final String ZERO_NUMBER = "0";
	private static final String BLANK = "";
	private String responseStatus;

	public String connectWithSessionCreateRQ(String xmlRequest, SessionCreateRQDto requestDto) {
		xmlRequest = xmlRequest.replace("{{user_name}}", requestDto.getUserName());
		xmlRequest = xmlRequest.replace("{{password}}", requestDto.getPassword());
		xmlRequest = xmlRequest.replace("{{pseudo_city_code}}", requestDto.getPseudoCityCode());
		String response = executeRequest(requestDto.getSwsUrl(), xmlRequest, requestDto.getSwsMethodRequest(), requestDto.getSwsContentType());
		response = _getBinarySecurityToken(response);

		return response;
	}

	public String getDataWithBargainFinderMax_ADRQ(String xmlRequest, BargainFinderMaxRQDto requestDto) {
		String passengerForAdt = requestDto.getNumOfAdt().equals(ZERO_NUMBER) ? BLANK : XML_PASSENGER_QUANTITY.replace("{{number}}", requestDto.getNumOfAdt());
		String passengerForCnn = requestDto.getNumOfCnn().equals(ZERO_NUMBER) ? BLANK : XML_PASSENGER_QUANTITY.replace("{{number}}", requestDto.getNumOfCnn());
		String passengerForIns = requestDto.getNumOfIns().equals(ZERO_NUMBER) ? BLANK : XML_PASSENGER_QUANTITY.replace("{{number}}", requestDto.getNumOfIns());
		String passengerForInf = requestDto.getNumOfInf().equals(ZERO_NUMBER) ? BLANK : XML_PASSENGER_QUANTITY.replace("{{number}}", requestDto.getNumOfInf());
		
		xmlRequest = xmlRequest.replace("{{binary_security_token}}", requestDto.getBinarySecurityToken());
		xmlRequest = xmlRequest.replace("{{pseudo_city_code}}", requestDto.getPseudoCityCode());
		xmlRequest = xmlRequest.replace("{{outbound_date_from}}", requestDto.getOutboundDateFrom());
		xmlRequest = xmlRequest.replace("{{outbound_date_to}}", requestDto.getOutboundDateTo());
		xmlRequest = xmlRequest.replace("{{outbound_time_from}}", requestDto.getOutboundTimeFrom());
		xmlRequest = xmlRequest.replace("{{outbound_time_to}}", requestDto.getOutboundTimeTo());
		xmlRequest = xmlRequest.replace("{{departure_airport}}", requestDto.getDepartureAirport());
		xmlRequest = xmlRequest.replace("{{arrival_airport}}", requestDto.getArrivalAirport());
		xmlRequest = xmlRequest.replace("{{stay_day}}", requestDto.getStayDay());
		xmlRequest = xmlRequest.replace("{{inbound_time_from}}", requestDto.getInboundTimeFrom());
		xmlRequest = xmlRequest.replace("{{inbound_time_to}}", requestDto.getInboundTimeTo());
		xmlRequest = xmlRequest.replace("{{carrier}}", requestDto.getCarrier());
		xmlRequest = xmlRequest.replace("{{stops}}", requestDto.getStops());
		xmlRequest = xmlRequest.replace("{{cabin}}", requestDto.getCabin());
		xmlRequest = xmlRequest.replace("{{exclude_codeshare}}", requestDto.getExcludeCodeshare());
		xmlRequest = xmlRequest.replace("{{free_piece}}", requestDto.getFreePiece());
		xmlRequest = xmlRequest.replace("{{seat}}", requestDto.getSeat());
		xmlRequest = xmlRequest.replace("{{num_of_adt}}", passengerForAdt);
		xmlRequest = xmlRequest.replace("{{num_of_cnn}}", passengerForCnn);
		xmlRequest = xmlRequest.replace("{{num_of_ins}}", passengerForIns);
		xmlRequest = xmlRequest.replace("{{num_of_inf}}", passengerForInf);

		String response = executeRequest(requestDto.getSwsUrl(), xmlRequest, requestDto.getSwsMethodRequest(), requestDto.getSwsContentType());
		return response;
	}

	public String disconnectWithSessionCloseRQ(String xmlRequest, SessionCloseRQDto requestDto) {
		xmlRequest = xmlRequest.replace("{{binary_security_token}}", requestDto.getBinarySecurityToken());
		xmlRequest = xmlRequest.replace("{{pseudo_city_code}}", requestDto.getPseudoCityCode());

		String response = executeRequest(requestDto.getSwsUrl(), xmlRequest, requestDto.getSwsMethodRequest(), requestDto.getSwsContentType());

		return response;
	}

	public String executeRequest(String url, String request, String methodRequest, String contentType) {
		try {
			responseStatus = BLANK;
			URL urlObj = new URL(url);
			HttpURLConnection connection = (HttpURLConnection) urlObj.openConnection();
			connection.setRequestMethod(methodRequest);
			connection.addRequestProperty("Content-Type", contentType);
			connection.setDoOutput(true);

			DataOutputStream streamWriter = new DataOutputStream(connection.getOutputStream());
			streamWriter.writeBytes(request);
			streamWriter.flush();
			streamWriter.close();

			responseStatus = connection.getResponseMessage();
			BufferedReader streamReader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = streamReader.readLine()) != null) {
				response.append(inputLine);
			}
			streamReader.close();
			connection.disconnect();

			return response.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return BLANK;
		}
	}

	private String _getBinarySecurityToken(String xml) {
		String binarySecurityToken = BLANK;

		XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
		try {
			InputStream inputStream = new ByteArrayInputStream(xml.getBytes(StandardCharsets.UTF_8));
			XMLEventReader xmlEventReader = xmlInputFactory.createXMLEventReader(inputStream);
			while (xmlEventReader.hasNext()) {
				XMLEvent xmlEvent = xmlEventReader.nextEvent();
				if (xmlEvent.isStartElement()) {
					StartElement startElement = xmlEvent.asStartElement();
					if (startElement.getName().getLocalPart().equals("BinarySecurityToken")) {
						Attribute valueTypeAttr = startElement.getAttributeByName(new QName("valueType"));
						Attribute encodingTypeAttr = startElement.getAttributeByName(new QName("EncodingType"));
						xmlEvent = xmlEventReader.nextEvent();
						binarySecurityToken = "<wsse:BinarySecurityToken valueType=\"" + valueTypeAttr.getValue() + "\" EncodingType=\"" + encodingTypeAttr.getValue() + "\">" + xmlEvent.asCharacters().getData() + "</wsse:BinarySecurityToken>";
					}
				}
			}
			xmlEventReader.close();
			inputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return binarySecurityToken;
	}

	public String getResponseStatus() {
		return responseStatus;
	}

	public void setResponseStatus(String responseStatus) {
		this.responseStatus = responseStatus;
	}
}
