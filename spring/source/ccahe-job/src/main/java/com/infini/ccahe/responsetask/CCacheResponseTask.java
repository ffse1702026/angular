package com.infini.ccahe.responsetask;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.zip.GZIPInputStream;

import javax.xml.namespace.QName;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;

import com.infini.ccahe.responsetask.model.Arrival;
import com.infini.ccahe.responsetask.model.BaggageInformation;
import com.infini.ccahe.responsetask.model.Carrier;
import com.infini.ccahe.responsetask.model.Departure;
import com.infini.ccahe.responsetask.model.Fare;
import com.infini.ccahe.responsetask.model.FareComponent;
import com.infini.ccahe.responsetask.model.FareComponentDesc;
import com.infini.ccahe.responsetask.model.FareMessage;
import com.infini.ccahe.responsetask.model.GroupDescription;
import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;
import com.infini.ccahe.responsetask.model.HiddenStop;
import com.infini.ccahe.responsetask.model.Itinerary;
import com.infini.ccahe.responsetask.model.ItineraryGroup;
import com.infini.ccahe.responsetask.model.Leg;
import com.infini.ccahe.responsetask.model.LegDesc;
import com.infini.ccahe.responsetask.model.LegDescription;
import com.infini.ccahe.responsetask.model.PassengerInfo;
import com.infini.ccahe.responsetask.model.PassengerTotalFare;
import com.infini.ccahe.responsetask.model.PenaltiesInfo;
import com.infini.ccahe.responsetask.model.Penalty;
import com.infini.ccahe.responsetask.model.PricingInformation;
import com.infini.ccahe.responsetask.model.Schedule;
import com.infini.ccahe.responsetask.model.ScheduleDesc;
import com.infini.ccahe.responsetask.model.Segment;
import com.infini.ccahe.responsetask.model.Tax;
import com.infini.ccahe.responsetask.model.TaxDesc;

public class CCacheResponseTask {
	//private static final Logger logger = LoggerFactory.getLogger(CCacheResponseTask.class);

	public GroupedItineraryResponse executeResponse(String xmlResponseCompressed) {
		String xmlResponseDecompressed = _getResponseDecompressed(xmlResponseCompressed);
		GroupedItineraryResponse groupedItineraryResponse = _parseXML(xmlResponseDecompressed);
		return groupedItineraryResponse;
	}

	private String _getResponseDecompressed(String xmlResponseCompressed) {
		String xmlResult = "";
		String compressedResponse = "";

		try {
			XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
			InputStream inputStream = new ByteArrayInputStream(xmlResponseCompressed.getBytes(StandardCharsets.UTF_8));
			xmlInputFactory.setProperty("javax.xml.stream.isCoalescing", true);
			XMLEventReader xmlEventReader = xmlInputFactory.createXMLEventReader(inputStream);

			while (xmlEventReader.hasNext()) {
				XMLEvent xmlEvent = xmlEventReader.nextEvent();
				if (xmlEvent.isStartElement()) {
					StartElement startElement = xmlEvent.asStartElement();
					if (startElement.getName().getLocalPart().equals("CompressedResponse")) {
						xmlEvent = xmlEventReader.nextEvent();
						compressedResponse = xmlEvent.asCharacters().getData();
					}
				}
			}
			xmlEventReader.close();
			inputStream.close();

			byte[] decodedBase64 = Base64.getDecoder().decode(compressedResponse);
			GZIPInputStream gzipInputStream = new GZIPInputStream(new ByteArrayInputStream(decodedBase64));
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(gzipInputStream, "UTF-8"));
			String line;
			while ((line = bufferedReader.readLine()) != null) {
				xmlResult += line;
			}
			xmlEventReader.close();
			inputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return xmlResult;
	}

	private GroupedItineraryResponse _parseXML(String xmlResponse) {
		GroupedItineraryResponse groupedItineraryResponse = null;
		ScheduleDesc scheduleDesc = null;
		Departure departure = null;
		Arrival arrival = null;
		Carrier carrier = null;
		HiddenStop hiddenStop = null;
		TaxDesc taxDesc = null;
		FareComponentDesc fareComponentDesc = null;
		LegDesc legDesc = null;
		Schedule schedule = null;
		ItineraryGroup itineraryGroup = null;
		GroupDescription groupDescription = null;
		LegDescription legDescription = null;
		Itinerary itinerary = null;
		Leg leg = null;
		PricingInformation pricingInformation = null;
		Fare fare = null;
		PassengerInfo passengerInfo = null;
		FareComponent fareComponent = null;
		Segment segment = null;
		Tax tax = null;
		FareMessage fareMessage = null;
		PassengerTotalFare passengerTotalFare = null;
		BaggageInformation baggageInformation = null;
		PenaltiesInfo penaltiesInfo = null;
		Penalty penalty = null;
		try {
			XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
			InputStream inputStream = new ByteArrayInputStream(xmlResponse.getBytes(StandardCharsets.UTF_8));
			xmlInputFactory.setProperty("javax.xml.stream.isCoalescing", true);
			XMLEventReader xmlEventReader = xmlInputFactory.createXMLEventReader(inputStream);

			String currentStartElementName = "";
			String currentEndElementName = "";
			boolean isStartedFareComponent = false;
			boolean isStartedBaggageInformation = false;
			while (xmlEventReader.hasNext()) {
				XMLEvent xmlEvent = xmlEventReader.nextEvent();
				if (xmlEvent.isStartElement()) {
					StartElement startElement = xmlEvent.asStartElement();
					currentStartElementName = startElement.getName().getLocalPart();
					if (currentStartElementName.equals("GroupedItineraryResponse")) {
						groupedItineraryResponse = _getGroupedItineraryResponse(startElement);
					} else if (currentStartElementName.equals("ScheduleDesc")) {
						scheduleDesc = _getScheduleDesc(startElement);
					} else if (currentStartElementName.equals("Departure")) {
						departure = _getDeparture(startElement);
					} else if (currentStartElementName.equals("Arrival")) {
						arrival = _getArrival(startElement);
					} else if (currentStartElementName.equals("Carrier")) {
						carrier = _getCarrier(startElement);
					} else if (currentStartElementName.equals("HiddenStop")) {
						hiddenStop = _getHiddenStop(startElement);
					} else if (currentStartElementName.equals("TaxDesc")) {
						taxDesc = _getTaxDesc(startElement);
					} else if (currentStartElementName.equals("FareComponentDesc")) {
						fareComponentDesc = _getFareComponentDesc(startElement);
					} else if (currentStartElementName.equals("LegDesc")) {
						legDesc = _getLegDesc(startElement);
					} else if (currentStartElementName.equals("Schedule")) {
						schedule = _getSchedule(startElement);
					} else if (currentStartElementName.equals("ItineraryGroup")) {
						itineraryGroup = _getItineraryGroup(startElement);
					} else if (currentStartElementName.equals("GroupDescription")) {
						groupDescription = _getGroupDescription(startElement);
					} else if (currentStartElementName.equals("LegDescription")) {
						legDescription = _getLegDescription(startElement);
					} else if (currentStartElementName.equals("Itinerary")) {
						itinerary = _getItinerary(startElement);
					} else if (currentStartElementName.equals("Leg")) {
						leg = _getLeg(startElement);
					} else if (currentStartElementName.equals("PricingInformation")) {
						pricingInformation = _getPricingInformation(startElement);
					} else if (currentStartElementName.equals("Fare")) {
						fare = _getFare(startElement);
					} else if (currentStartElementName.equals("PassengerInfo")) {
						passengerInfo = _getPassengerInfo(startElement);
					} else if (currentStartElementName.equals("FareComponent")) {
						fareComponent = _getFareComponent(startElement);
						isStartedFareComponent = true;
					} else if (currentStartElementName.equals("Segment")) {
						segment = _getSegment(startElement);
					} else if (currentStartElementName.equals("Tax")) {
						tax = _getTax(startElement);
					} else if (currentStartElementName.equals("FareMessage")) {
						fareMessage = _getFareMessage(startElement);
					} else if (currentStartElementName.equals("PassengerTotalFare")) {
						passengerTotalFare = _getPassengerTotalFare(startElement);
					} else if (currentStartElementName.equals("BaggageInformation")) {
						baggageInformation = _getBaggageInformation(startElement);
						isStartedBaggageInformation = true;
					} else if (currentStartElementName.equals("PenaltiesInfo")) {
						penaltiesInfo = _getPenaltiesInfo(startElement);
					} else if (currentStartElementName.equals("Penalty")) {
						penalty = _getPenalty(startElement);
					}
				}

				if (xmlEvent.isEndElement()) {
					EndElement endElement = xmlEvent.asEndElement();
					currentEndElementName = endElement.getName().getLocalPart();
					if (currentEndElementName.equals("GroupedItineraryResponse")) {
						break;
					} else if (currentEndElementName.equals("ScheduleDesc")) {
						groupedItineraryResponse.getScheduleDescs().add(scheduleDesc);
					} else if (currentEndElementName.equals("Departure")) {
						scheduleDesc.getDepartures().add(departure);
					} else if (currentEndElementName.equals("Arrival")) {
						scheduleDesc.getArrivals().add(arrival);
					} else if (currentEndElementName.equals("Carrier")) {
						scheduleDesc.getCarriers().add(carrier);
					} else if (currentEndElementName.equals("HiddenStop")) {
						scheduleDesc.getHiddenStops().add(hiddenStop);
					} else if (currentEndElementName.equals("TaxDesc")) {
						groupedItineraryResponse.getTaxDescs().add(taxDesc);
					} else if (currentEndElementName.equals("FareComponentDesc")) {
						groupedItineraryResponse.getFareComponentDescs().add(fareComponentDesc);
					} else if (currentEndElementName.equals("LegDesc")) {
						groupedItineraryResponse.getLegDescs().add(legDesc);
					} else if (currentEndElementName.equals("Schedule")) {
						legDesc.getSchedules().add(schedule);
					} else if (currentEndElementName.equals("ItineraryGroup")) {
						groupedItineraryResponse.getItineraryGroups().add(itineraryGroup);
					} else if (currentEndElementName.equals("GroupDescription")) {
						itineraryGroup.getGroupDescriptions().add(groupDescription);
					} else if (currentEndElementName.equals("LegDescription")) {
						groupDescription.getLegDescriptions().add(legDescription);
					} else if (currentEndElementName.equals("Itinerary")) {
						itineraryGroup.getItineraries().add(itinerary);
					} else if (currentEndElementName.equals("Leg")) {
						itinerary.getLegs().add(leg);
					} else if (currentEndElementName.equals("PricingInformation")) {
						itinerary.getPricingInformations().add(pricingInformation);
					} else if (currentEndElementName.equals("Fare")) {
						pricingInformation.getFares().add(fare);
					} else if (currentEndElementName.equals("PassengerInfo")) {
						fare.getPassengerInfos().add(passengerInfo);
					} else if (currentEndElementName.equals("FareComponent")) {
						passengerInfo.getFareComponents().add(fareComponent);
						isStartedFareComponent = false;
					} else if (currentEndElementName.equals("Segment")) {
						if (isStartedFareComponent) {
							fareComponent.getSegments().add(segment);
						} else if (isStartedBaggageInformation) {
							baggageInformation.getSegments().add(segment);
						}
					} else if (currentEndElementName.equals("Tax")) {
						passengerInfo.getTaxs().add(tax);
					} else if (currentEndElementName.equals("FareMessage")) {
						passengerInfo.getFareMessages().add(fareMessage);
					} else if (currentEndElementName.equals("PassengerTotalFare")) {
						passengerInfo.getPassengerTotalFares().add(passengerTotalFare);
					} else if (currentEndElementName.equals("BaggageInformation")) {
						passengerInfo.getBaggageInformations().add(baggageInformation);
						isStartedBaggageInformation = false;
					} else if (currentEndElementName.equals("PenaltiesInfo")) {
						passengerInfo.getPenaltiesInfos().add(penaltiesInfo);
					} else if (currentEndElementName.equals("Penalty")) {
						penaltiesInfo.getPenalties().add(penalty);
					}
				}
			}
			xmlEventReader.close();
			inputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return groupedItineraryResponse;
	}

	private GroupedItineraryResponse _getGroupedItineraryResponse(StartElement startElement) {
		GroupedItineraryResponse groupedItineraryResponse = new GroupedItineraryResponse();
		groupedItineraryResponse.setScheduleDescs(new ArrayList<ScheduleDesc>());
		groupedItineraryResponse.setTaxDescs(new ArrayList<TaxDesc>());
		groupedItineraryResponse.setFareComponentDescs(new ArrayList<FareComponentDesc>());
		groupedItineraryResponse.setLegDescs(new ArrayList<LegDesc>());
		groupedItineraryResponse.setItineraryGroups(new ArrayList<ItineraryGroup>());

		return groupedItineraryResponse;
	}

	private ScheduleDesc _getScheduleDesc(StartElement startElement) {
		ScheduleDesc scheduleDesc = new ScheduleDesc();
		scheduleDesc.setDepartures(new ArrayList<Departure>());
		scheduleDesc.setArrivals(new ArrayList<Arrival>());
		scheduleDesc.setCarriers(new ArrayList<Carrier>());
		scheduleDesc.setHiddenStops(new ArrayList<HiddenStop>());
		Attribute idAttr = startElement.getAttributeByName(new QName("ID"));
		Attribute stopsAttr = startElement.getAttributeByName(new QName("Stops"));
		if (idAttr != null) {
			scheduleDesc.setId(idAttr.getValue());
		}
		if (stopsAttr != null) {
			scheduleDesc.setStops(stopsAttr.getValue());
		}

		return scheduleDesc;
	}

	private Departure _getDeparture(StartElement startElement) {
		Departure departure = new Departure();
		Attribute airportAttr = startElement.getAttributeByName(new QName("Airport"));
		Attribute timeAttr = startElement.getAttributeByName(new QName("Time"));
		if (airportAttr != null) {
			departure.setAirport(airportAttr.getValue());
		}
		if (timeAttr != null) {
			departure.setTime(timeAttr.getValue());
		}

		return departure;
	}

	private Arrival _getArrival(StartElement startElement) {
		Arrival arrival = new Arrival();
		Attribute airportAttr = startElement.getAttributeByName(new QName("Airport"));
		Attribute timeAttr = startElement.getAttributeByName(new QName("Time"));
		Attribute dateAdjustmentAttr = startElement.getAttributeByName(new QName("DateAdjustment"));
		if (airportAttr != null) {
			arrival.setAirport(airportAttr.getValue());
		}
		if (timeAttr != null) {
			arrival.setTime(timeAttr.getValue());
		}
		if (dateAdjustmentAttr != null) {
			arrival.setDateAdjustment(dateAdjustmentAttr.getValue());
		}

		return arrival;
	}

	private Carrier _getCarrier(StartElement startElement) {
		Carrier carrier = new Carrier();
		Attribute marketingAttr = startElement.getAttributeByName(new QName("Marketing"));
		Attribute marketingFlightNumberAttr = startElement.getAttributeByName(new QName("MarketingFlightNumber"));
		Attribute operatingAttr = startElement.getAttributeByName(new QName("Operating"));
		Attribute operatingFlightNumberAttr = startElement.getAttributeByName(new QName("OperatingFlightNumber"));
		if (marketingAttr != null) {
			carrier.setMarketing(marketingAttr.getValue());
		}
		if (marketingFlightNumberAttr != null) {
			carrier.setMarketingFlightNumber(marketingFlightNumberAttr.getValue());
		}
		if (operatingAttr != null) {
			carrier.setOperating(operatingAttr.getValue());
		}
		if (operatingFlightNumberAttr != null) {
			carrier.setOperatingFlightNumber(operatingFlightNumberAttr.getValue());
		}

		return carrier;
	}

	private HiddenStop _getHiddenStop(StartElement startElement) {
		HiddenStop hiddenStop = new HiddenStop();
		Attribute airportAttr = startElement.getAttributeByName(new QName("Airport"));
		Attribute arrivalTimeAttr = startElement.getAttributeByName(new QName("ArrivalTime"));
		Attribute arrivalDateAdjustmentAttr = startElement.getAttributeByName(new QName("ArrivalDateAdjustment"));
		Attribute departureTimeAttr = startElement.getAttributeByName(new QName("DepartureTime"));
		Attribute departureDateAdjustmentAttr = startElement.getAttributeByName(new QName("DepartureDateAdjustment"));
		if (airportAttr != null) {
			hiddenStop.setAirport(airportAttr.getValue());
		}
		if (arrivalTimeAttr != null) {
			hiddenStop.setArrivalTime(arrivalTimeAttr.getValue());
		}
		if (arrivalDateAdjustmentAttr != null) {
			hiddenStop.setArrivalDateAdjustment(arrivalDateAdjustmentAttr.getValue());
		}
		if (departureTimeAttr != null) {
			hiddenStop.setDepartureTime(departureTimeAttr.getValue());
		}
		if (departureDateAdjustmentAttr != null) {
			hiddenStop.setDepartureDateAdjustment(departureDateAdjustmentAttr.getValue());
		}

		return hiddenStop;
	}

	private TaxDesc _getTaxDesc(StartElement startElement) {
		TaxDesc taxDesc = new TaxDesc();
		Attribute idAttr = startElement.getAttributeByName(new QName("ID"));
		Attribute codeAttr = startElement.getAttributeByName(new QName("Code"));
		Attribute amountAttr = startElement.getAttributeByName(new QName("Amount"));
		if (idAttr != null) {
			taxDesc.setId(idAttr.getValue());
		}
		if (codeAttr != null) {
			taxDesc.setCode(codeAttr.getValue());
		}
		if (amountAttr != null) {
			taxDesc.setAmount(amountAttr.getValue());
		}

		return taxDesc;
	}

	private FareComponentDesc _getFareComponentDesc(StartElement startElement) {
		FareComponentDesc fareComponentDesc = new FareComponentDesc();
		Attribute idAttr = startElement.getAttributeByName(new QName("ID"));
		Attribute fareBasisCodeAttr = startElement.getAttributeByName(new QName("FareBasisCode"));
		Attribute farePassengerTypeAttr = startElement.getAttributeByName(new QName("FarePassengerType"));
		if (idAttr != null) {
			fareComponentDesc.setId(idAttr.getValue());
		}
		if (fareBasisCodeAttr != null) {
			fareComponentDesc.setFareBasisCode(fareBasisCodeAttr.getValue());
		}
		if (farePassengerTypeAttr != null) {
			fareComponentDesc.setFarePassengerType(farePassengerTypeAttr.getValue());
		}

		return fareComponentDesc;
	}

	private LegDesc _getLegDesc(StartElement startElement) {
		LegDesc legDesc = new LegDesc();
		legDesc.setSchedules(new ArrayList<Schedule>());
		Attribute idAttr = startElement.getAttributeByName(new QName("ID"));
		if (idAttr != null) {
			legDesc.setId(idAttr.getValue());
		}

		return legDesc;
	}

	private Schedule _getSchedule(StartElement startElement) {
		Schedule schedule = new Schedule();
		Attribute refAttr = startElement.getAttributeByName(new QName("Ref"));
		Attribute departureDateAdjustmentAttr = startElement.getAttributeByName(new QName("DepartureDateAdjustment"));
		Attribute requestedStoppoverAttr = startElement.getAttributeByName(new QName("RequestedStoppover"));
		if (refAttr != null) {
			schedule.setRef(refAttr.getValue());
		}
		if (departureDateAdjustmentAttr != null) {
			schedule.setDepartureDateAdjustment(departureDateAdjustmentAttr.getValue());
		}
		if (requestedStoppoverAttr != null) {
			schedule.setRequestedStoppover(requestedStoppoverAttr.getValue());
		}

		return schedule;
	}

	private ItineraryGroup _getItineraryGroup(StartElement startElement) {
		ItineraryGroup itineraryGroup = new ItineraryGroup();
		itineraryGroup.setGroupDescriptions(new ArrayList<GroupDescription>());
		itineraryGroup.setItineraries(new ArrayList<Itinerary>());

		return itineraryGroup;
	}

	private GroupDescription _getGroupDescription(StartElement startElement) {
		GroupDescription groupDescription = new GroupDescription();
		groupDescription.setLegDescriptions(new ArrayList<LegDescription>());

		return groupDescription;
	}

	private LegDescription _getLegDescription(StartElement startElement) {
		LegDescription legDescription = new LegDescription();
		Attribute departureDateAttr = startElement.getAttributeByName(new QName("DepartureDate"));
		if (departureDateAttr != null) {
			legDescription.setDepartureDate(departureDateAttr.getValue());
		}

		return legDescription;
	}

	private Itinerary _getItinerary(StartElement startElement) {
		Itinerary itinerary = new Itinerary();
		itinerary.setLegs(new ArrayList<Leg>());
		itinerary.setPricingInformations(new ArrayList<PricingInformation>());

		return itinerary;
	}

	private Leg _getLeg(StartElement startElement) {
		Leg leg = new Leg();
		Attribute refAttr = startElement.getAttributeByName(new QName("Ref"));
		if (refAttr != null) {
			leg.setRef(refAttr.getValue());
		}

		return leg;
	}

	private PricingInformation _getPricingInformation(StartElement startElement) {
		PricingInformation pricingInformation = new PricingInformation();
		pricingInformation.setFares(new ArrayList<Fare>());

		return pricingInformation;
	}

	private Fare _getFare(StartElement startElement) {
		Fare fare = new Fare();
		fare.setPassengerInfos(new ArrayList<PassengerInfo>());
		Attribute validatingCarrierCodeAttr = startElement.getAttributeByName(new QName("ValidatingCarrierCode"));
		Attribute lastTicketDateAttr = startElement.getAttributeByName(new QName("LastTicketDate"));
		if (validatingCarrierCodeAttr != null) {
			fare.setValidatingCarrierCode(validatingCarrierCodeAttr.getValue());
		}
		
		if (lastTicketDateAttr != null) {
			fare.setLastTicketDate(lastTicketDateAttr.getValue());
		}

		return fare;
	}

	private PassengerInfo _getPassengerInfo(StartElement startElement) {
		PassengerInfo passengerInfo = new PassengerInfo();
		passengerInfo.setFareComponents(new ArrayList<FareComponent>());
		passengerInfo.setTaxs(new ArrayList<Tax>());
		passengerInfo.setFareMessages(new ArrayList<FareMessage>());
		passengerInfo.setPassengerTotalFares(new ArrayList<PassengerTotalFare>());
		passengerInfo.setBaggageInformations(new ArrayList<BaggageInformation>());
		passengerInfo.setPenaltiesInfos(new ArrayList<PenaltiesInfo>());
		Attribute passengerTypeAttr = startElement.getAttributeByName(new QName("PassengerType"));
		Attribute nonRefundableAttr = startElement.getAttributeByName(new QName("NonRefundable"));
		if (passengerTypeAttr != null) {
			passengerInfo.setPassengerType(passengerTypeAttr.getValue());
		}
		if (nonRefundableAttr != null) {
			passengerInfo.setNonRefundable(nonRefundableAttr.getValue());
		}

		return passengerInfo;
	}

	private FareComponent _getFareComponent(StartElement startElement) {
		FareComponent fareComponent = new FareComponent();
		fareComponent.setSegments(new ArrayList<Segment>());
		Attribute refAttr = startElement.getAttributeByName(new QName("Ref"));
		if (refAttr != null) {
			fareComponent.setRef(refAttr.getValue());
		}

		return fareComponent;
	}

	private Segment _getSegment(StartElement startElement) {
		Segment segment = new Segment();
		Attribute bookingCodeAttr = startElement.getAttributeByName(new QName("BookingCode"));
		Attribute cabinCodeAttr = startElement.getAttributeByName(new QName("CabinCode"));
		Attribute seatsAvailableAttr = startElement.getAttributeByName(new QName("SeatsAvailable"));
		Attribute availabilityBreakAttr = startElement.getAttributeByName(new QName("AvailabilityBreak"));
		Attribute idAttr = startElement.getAttributeByName(new QName("ID"));

		if (bookingCodeAttr != null) {
			segment.setBookingCode(bookingCodeAttr.getValue());
		}
		if (cabinCodeAttr != null) {
			segment.setCabinCode(cabinCodeAttr.getValue());
		}
		if (seatsAvailableAttr != null) {
			segment.setSeatsAvailable(seatsAvailableAttr.getValue());
		}
		if (availabilityBreakAttr != null) {
			segment.setAvailabilityBreak(availabilityBreakAttr.getValue());
		}
		if (idAttr != null) {
			segment.setId(idAttr.getValue());
		}

		return segment;
	}

	private Tax _getTax(StartElement startElement) {
		Tax tax = new Tax();
		Attribute refAttr = startElement.getAttributeByName(new QName("Ref"));
		if (refAttr != null) {
			tax.setRef(refAttr.getValue());
		}

		return tax;
	}

	private FareMessage _getFareMessage(StartElement startElement) {
		FareMessage fareMessage = new FareMessage();
		Attribute infoAttr = startElement.getAttributeByName(new QName("Info"));
		if (infoAttr != null) {
			fareMessage.setInfo(infoAttr.getValue());
		}

		return fareMessage;
	}

	private PassengerTotalFare _getPassengerTotalFare(StartElement startElement) {
		PassengerTotalFare passengerTotalFare = new PassengerTotalFare();
		Attribute totalFareAttr = startElement.getAttributeByName(new QName("TotalFare"));
		Attribute totalTaxesAttr = startElement.getAttributeByName(new QName("TotalTaxes"));
		Attribute equivalentAmountAttr = startElement.getAttributeByName(new QName("EquivalentAmount"));
		if (totalFareAttr != null) {
			passengerTotalFare.setTotalFare(totalFareAttr.getValue());
		}
		if (totalTaxesAttr != null) {
			passengerTotalFare.setTotalTaxes(totalTaxesAttr.getValue());
		}
		if (equivalentAmountAttr != null) {
			passengerTotalFare.setEquivalentAmount(equivalentAmountAttr.getValue());
		}

		return passengerTotalFare;
	}

	private BaggageInformation _getBaggageInformation(StartElement startElement) {
		BaggageInformation baggageInformation = new BaggageInformation();
		baggageInformation.setSegments(new ArrayList<Segment>());
		Attribute provisionTypeAttr = startElement.getAttributeByName(new QName("ProvisionType"));
		if (provisionTypeAttr != null) {
			baggageInformation.setProvisionType(provisionTypeAttr.getValue());
		}

		return baggageInformation;
	}

	private PenaltiesInfo _getPenaltiesInfo(StartElement startElement) {
		PenaltiesInfo penaltiesInfo = new PenaltiesInfo();
		penaltiesInfo.setPenalties(new ArrayList<Penalty>());

		return penaltiesInfo;
	}

	private Penalty _getPenalty(StartElement startElement) {
		Penalty penalty = new Penalty();
		Attribute typeAttr = startElement.getAttributeByName(new QName("Type"));
		Attribute applicabilityAttr = startElement.getAttributeByName(new QName("Applicability"));
		Attribute amountAttr = startElement.getAttributeByName(new QName("Amount"));
		if (typeAttr != null) {
			penalty.setType(typeAttr.getValue());
		}
		if (applicabilityAttr != null) {
			penalty.setApplicability(applicabilityAttr.getValue());
		}
		if (amountAttr != null) {
			penalty.setAmount(amountAttr.getValue());
		}

		return penalty;
	}
}
