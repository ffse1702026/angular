package com.infini.ccahe.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.infini.ccahe.common.Constant;
import com.infini.ccahe.entity.RsFareComponent;
import com.infini.ccahe.entity.RsFareComponentPK;
import com.infini.ccahe.repository.RsFareComponentRepository;
import com.infini.ccahe.responsetask.model.BaggageInformation;
import com.infini.ccahe.responsetask.model.Fare;
import com.infini.ccahe.responsetask.model.GroupedItineraryResponse;
import com.infini.ccahe.responsetask.model.Itinerary;
import com.infini.ccahe.responsetask.model.ItineraryGroup;
import com.infini.ccahe.responsetask.model.PassengerInfo;
import com.infini.ccahe.responsetask.model.PassengerTotalFare;
import com.infini.ccahe.responsetask.model.PenaltiesInfo;
import com.infini.ccahe.responsetask.model.Penalty;
import com.infini.ccahe.responsetask.model.PricingInformation;
import com.infini.ccahe.service.RsFareComponentService;
import com.infini.ccahe.utils.StringUtils;

public class RsFareComponentServiceImpl implements RsFareComponentService {
    private RsFareComponentRepository rsFareComponentRepository;

    public RsFareComponentServiceImpl() {
    }

    public RsFareComponentServiceImpl(RsFareComponentRepository rsFareComponentRepository) {
        this.rsFareComponentRepository = rsFareComponentRepository;
    }

    @Override
    public int deleteRsFareComponentByCacheId(String cacheId) {
        try {
            if (!StringUtils.isNullOrEmpty(cacheId)) {
                List<RsFareComponent> rsFareComponents = this.rsFareComponentRepository.findAllByCacheId(cacheId);
                if (rsFareComponents != null) {
                    this.rsFareComponentRepository.deleteAll(rsFareComponents);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    @Override
    public int insertRsFareComponent(String cacheId, GroupedItineraryResponse responseObj) {
        try {
            List<ItineraryGroup> itineraryGroups = responseObj.getItineraryGroups();
            int itineraryId = 1;
            for (ItineraryGroup itineraryGroup : itineraryGroups) {
                List<Itinerary> itinerarys = itineraryGroup.getItineraries();
                for (Itinerary itinerary : itinerarys) {
                    List<PricingInformation> pricingInformations = itinerary.getPricingInformations();
                    for (PricingInformation pricingInformation : pricingInformations) {
                        List<Fare> fares = pricingInformation.getFares();
                        for (Fare fare : fares) {
                            List<PassengerInfo> passengerInfos = fare.getPassengerInfos();
                            for (PassengerInfo passengerInfo : passengerInfos) {
                                List<PassengerTotalFare> passengerTotalFares = passengerInfo.getPassengerTotalFares();
                                List<PenaltiesInfo> penaltiesInfos = passengerInfo.getPenaltiesInfos();
                                List<BaggageInformation> baggageInformation = passengerInfo.getBaggageInformations();
                                for (PassengerTotalFare passengerTotalFare : passengerTotalFares) {
                                    DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(Constant.FORMAT_DATE_TIME);
                                    String currentTime = dateTimeFormatter.format(LocalDateTime.now());

                                    RsFareComponentPK rsFareComponentPK = new RsFareComponentPK();
                                    rsFareComponentPK.setCacheId(cacheId);
                                    rsFareComponentPK.setItineraryId(Short.valueOf(String.valueOf(itineraryId)));
                                    rsFareComponentPK.setPassengerType(passengerInfo.getPassengerType());

                                    RsFareComponent rsFareComponent = new RsFareComponent();
                                    rsFareComponent.setId(rsFareComponentPK);
                                    rsFareComponent.setValidatingCarrier(fare.getValidatingCarrierCode());
                                    if (fare.getLastTicketDate()!= null) {
                                        rsFareComponent.setLastTicketDate(fare.getLastTicketDate().replaceAll("-", ""));
                                    }

                                    if (passengerTotalFare.getTotalFare() != null) {
                                        rsFareComponent.setTotalFare(Integer.valueOf(passengerTotalFare.getTotalFare()));    
                                    }
                                    if (passengerTotalFare.getTotalTaxes() != null) {
                                        rsFareComponent.setTotalTax(Integer.valueOf(passengerTotalFare.getTotalTaxes()));    
                                    }
                                    if (passengerTotalFare.getEquivalentAmount() != null) {
                                        rsFareComponent.setBaseFare(Integer.valueOf(passengerTotalFare.getEquivalentAmount()));
                                    }
                                    rsFareComponent.setNonRefundable(passengerInfo.getNonRefundable());
                                    rsFareComponent.setExchangeBefore(_getExchangeBefore(penaltiesInfos));
                                    rsFareComponent.setExchangeAfter(_getExchangeAfter(penaltiesInfos));
                                    rsFareComponent.setRefundBefore(_getRefundBefore(penaltiesInfos));
                                    rsFareComponent.setRefundAfter(_getRefundAfter(penaltiesInfos));
                                    rsFareComponent.setBaggage(baggageInformation.get(0).getProvisionType());
                                    rsFareComponent.setCreatedTime(currentTime);
                                    rsFareComponent.setLastUpdatedTime(currentTime);
                                    rsFareComponentRepository.save(rsFareComponent);
                                }
                            }
                        }
                    }
                    itineraryId++;
                }
            }

            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    private int _getExchangeBefore(List<PenaltiesInfo> penaltiesInfos) {
        for (PenaltiesInfo penaltiesInfo : penaltiesInfos) {
            List<Penalty> penalties = penaltiesInfo.getPenalties();
            for (Penalty penalty : penalties) {
                if(penalty.getType().equals("Exchange") && penalty.getApplicability().equals("Before") && penalty.getAmount() != null) {
                    return Integer.valueOf(penalty.getAmount());
                }
            }
        }

        return 0;
    }

    private int _getExchangeAfter(List<PenaltiesInfo> penaltiesInfos) {
        for (PenaltiesInfo penaltiesInfo : penaltiesInfos) {
            List<Penalty> penalties = penaltiesInfo.getPenalties();
            for (Penalty penalty : penalties) {
                if(penalty.getType().equals("Exchange") && penalty.getApplicability().equals("After") && penalty.getAmount() != null) {
                    return Integer.valueOf(penalty.getAmount());
                }
            }
        }

        return 0;
    }

    private int _getRefundBefore(List<PenaltiesInfo> penaltiesInfos) {
        for (PenaltiesInfo penaltiesInfo : penaltiesInfos) {
            List<Penalty> penalties = penaltiesInfo.getPenalties();
            for (Penalty penalty : penalties) {
                if(penalty.getType().equals("Refund") && penalty.getApplicability().equals("Before") && penalty.getAmount() != null) {
                    return Integer.valueOf(penalty.getAmount());
                }
            }
        }

        return 0;
    }

    private int _getRefundAfter(List<PenaltiesInfo> penaltiesInfos) {
        for (PenaltiesInfo penaltiesInfo : penaltiesInfos) {
            List<Penalty> penalties = penaltiesInfo.getPenalties();
            for (Penalty penalty : penalties) {
                if(penalty.getType().equals("Refund") && penalty.getApplicability().equals("After") && penalty.getAmount() != null) {
                    return Integer.valueOf(penalty.getAmount());
                }
            }
        }

        return 0;
    }
}
