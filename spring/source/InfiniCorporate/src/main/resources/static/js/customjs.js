var airports = [ {
	"airportCode" : "MEL",
	"cityName" : "Melbourne, Australia"
}, {
	"airportCode" : "LAX",
	"cityName" : "Los Angeles, USA"
}, {
	"airportCode" : "LHR",
	"cityName" : "Heathrow, London"
}, {
	"airportCode" : "HKG",
	"cityName" : "Hong Kong"
}, {
	"airportCode" : "NRT",
	"cityName" : "Narita, Tokyo, Japan"
}, {
	"airportCode" : "FRA",
	"cityName" : "Frankfurt, Germany"
} ];

var airlines = [ "VN Airline", "VietJet ", "JP Airline", "Jetstar" ];

var airlineAlliance = [ "SkyTeam", "Star Alliance", "Value Alliance"

]

function testAjax() {
	var result = [];
	var obj = {};
	$.ajax({
		url : "/holiday",
		async : false,
		success : function(data) {
			$.each(data, function(i, holidayItem) {
				obj[new Date(holidayItem.date)] = new Date(holidayItem.date)
						.toString();
			});
		}
	});
	return obj;
}

var eventDates = testAjax();

var currentDate = new Date();

$('#calendar').datepicker({
	beforeShowDay : function(date) {
		var highlight = eventDates[date];
		if (highlight) {
			return [ true, "event", highlight ];
		} else {
			return [ true, '', '' ];
		}
	}
});

var minLength = 3;
$("#inf-depart-city-input")
		.autocomplete(
				{
					source : function(request, response) {
						var regex = /[\u3000-\u303F]|[\u3040-\u309F]|[\u30A0-\u30FF]|[\uFF00-\uFFEF]|[\u4E00-\u9FAF]|[\u2605-\u2606]|[\u2190-\u2195]|\u203B/g;
						var searchTerm = request.term.toLowerCase();
						var characterEngLish = true;
						if (searchTerm.length > 2 && regex.test(searchTerm)) {
							$("#inf-depart-city-input").val("");
						}
						if (searchTerm.length > 3 && !regex.test(searchTerm)) {
							$("#inf-depart-city-input").val("");
						} else if (regex.test(searchTerm)
								&& searchTerm.length == 2) {
							characterEngLish = false;
							$.post({
								url : "/airport",
								data : {
									parameter : searchTerm,
									characterEngLish : characterEngLish
								},
								dataType : "json",
								success : function(data) {
									var ret = [];
									if (data.length == 0) {
										$("#inf-depart-city-input").val("");
									} else {
										$.each(data, function(i, airportItem) {
											airportItem.label = airportItem.name + '(' + airportItem.code+ ')';
											airportItem.classify = airportItem.classify;
											airportItem.include = airportItem.include;
											ret.push(airportItem);
										});
										response(ret);
									}
								}
							});
						} else if (!regex.test(searchTerm)
								&& searchTerm.length == 3) {
							var characterEngLish = true;
							$
									.post({
										url : "/airport",
										data : {
											parameter : searchTerm,
											characterEngLish : characterEngLish
										},
										dataType : "json",
										success : function(data) {
											var ret = [];
											if (data.length == 0) {
												$("#inf-depart-city-input")
														.val("");
											} else {
												$.each(data,function(i, airportItem) {
													airportItem.label = airportItem.name + '(' + airportItem.code+ ')';
													airportItem.classify = airportItem.classify;
													airportItem.include = airportItem.include;
													ret.push(airportItem);
												});
												response(ret);
											}

										}
									});
						}

					},
					focus : function(event, ui) {
						$("#inf-depart-city-input").val(ui.item.label);
						return false;
					},
					select : function(event, ui) {
						$("#inf-depart-city-input").val(ui.item.label);

						return false;
					}
				}).data("ui-autocomplete")._renderItem = function(ul, item) {
	var element = "";
	if(item.classify == 'city'){
		element = "<img src='/img/building.png' style='max-width: 80%;max-height: 80%;background:none;border:none'/>";
	}else if(item.classify == 'airport' && item.include == 'inside' ){
		element = "<img src='/img/runway.png' style='margin-left:20px;max-width: 80%;max-height: 80%;background:none;border:none'/>";
	}else if(item.classify == 'airport' && item.include == 'outside' ){
		element = "<img src='/img/runway.png' style='max-width: 80%;max-height: 80%;background:none;border:none'/>";
	}
	return $(
			"<li class='sugguest-airport' style='padding: 10px 0px 0px 5px; list-style: none; word-break: break-all;'>")
			.append(element)
			.append(item.label).appendTo(ul);
}

$("#inf-arrival-city-input")
		.autocomplete(
				{
					source : function(request, response) {
						var regex = /[\u3000-\u303F]|[\u3040-\u309F]|[\u30A0-\u30FF]|[\uFF00-\uFFEF]|[\u4E00-\u9FAF]|[\u2605-\u2606]|[\u2190-\u2195]|\u203B/g;
						var searchTerm = request.term.toLowerCase();
						var characterEngLish = true;
						if (searchTerm.length > 2 && regex.test(searchTerm)) {
							$("#inf-arrival-city-input").val("");
						}
						if (searchTerm.length > 3 && !regex.test(searchTerm)) {
							$("#inf-arrival-city-input").val("");
						} else if (regex.test(searchTerm)
								&& searchTerm.length == 2) {
							characterEngLish = false;
							$.post({
								url : "/airport",
								data : {
									parameter : searchTerm,
									characterEngLish : characterEngLish
								},
								dataType : "json",
								success : function(data) {
									var ret = [];
									if (data.length == 0) {
										$("#inf-arrival-city-input").val("");
									} else {
										$.each(data, function(i, airportItem) {
											airportItem.label = airportItem.name + '(' + airportItem.code+ ')';
											airportItem.classify = airportItem.classify;
											airportItem.include = airportItem.include;
											ret.push(airportItem);
										});
										response(ret);
									}
								}
							});
						} else if (!regex.test(searchTerm)
								&& searchTerm.length == 3) {
							var characterEngLish = true;
							$.post({
								url : "/airport",
								data : {
									parameter : searchTerm,
									characterEngLish : characterEngLish
								},
								dataType : "json",
								success : function(data) {
									var ret = [];
									if (data.length == 0) {
										$("#inf-arrival-city-input").val("");
									} else {
										$.each(data, function(i, airportItem) {
											airportItem.label = airportItem.name + '(' + airportItem.code+ ')';
											airportItem.classify = airportItem.classify;
											airportItem.include = airportItem.include;
											ret.push(airportItem);
										});
										response(ret);
									}

								}
							});
						}

					},
					focus : function(event, ui) {
						$("#inf-arrival-city-input").val(ui.item.label);
						return false;
					},
					select : function(event, ui) {
						$("#inf-arrival-city-input").val(ui.item.label);
						return false;
					}
				}).data("ui-autocomplete")._renderItem = function(ul, item) {
					var element = "";
					if(item.classify == 'city'){
						element = "<img src='/img/building.png' style='max-width: 80%;max-height: 80%;background:none;border:none'/>";
					}else if(item.classify == 'airport' && item.include == 'inside' ){
						element = "<img src='/img/runway.png' style='margin-left:20px;max-width: 80%;max-height: 80%;background:none;border:none'/>";
					}else if(item.classify == 'airport' && item.include == 'outside' ){
						element = "<img src='/img/runway.png' style='max-width: 80%;max-height: 80%;background:none;border:none'/>";
					}
					return $(
							"<li class='sugguest-airport' style='padding: 10px 0px 0px 5px; list-style: none; word-break: break-all;'>")
							.append(element)
							.append(item.label).appendTo(ul);
				};

$("#airline1").autocomplete({
	source : function(request, response) {
		var searchTerm = request.term.toLowerCase();
		if(searchTerm.length > 2){
			$("#airline1").val("");
		}
		else if(searchTerm.length == 2){
		$.post({
			url : "/carrier",
			data : {
				parameter : searchTerm
			},
			dataType : "json",
			success : function(data) {
				var ret = [];
				if (data.length == 0) {
					$("#airline1").val("");
				} else {
					$.each(data, function(i, carrierItem) {
						carrierItem.name = carrierItem.name;
						ret.push(carrierItem);
					});
					response(ret);
				}
			}
		});
		}
	},
	length : 2,
	focus : function(event, ui) {
		$("#airline1").val(ui.item.name);
		return false;
	},
	select : function(event, ui) {
		$("#airline1").val(ui.item.name);
		return false;
	},
	
}).data("ui-autocomplete")._renderItem = function(ul, item) {
	var element = "<img src='/img/plane.png' style='max-width: 80%;max-height: 80%;background:none;border:none'/>";
	return $(
			"<li class='sugguest-plane' style='padding: 10px 0px 0px 5px; list-style: none; word-break: break-all;'>")
			.append(element)
			.append(item.name).appendTo(ul);
};

$("#airline2").autocomplete({
	source : function(request, response) {
		var searchTerm = request.term.toLowerCase();
		if(searchTerm.length > 2){
			$("#airline2").val("");
		}
		else if(searchTerm.length == 2){
		$.post({
			url : "/carrier",
			data : {
				parameter : searchTerm
			},
			dataType : "json",
			success : function(data) {
				var ret = [];
				if (data.length == 0) {
					$("#airline2").val("");
				} else {
					$.each(data, function(i, carrierItem) {
						carrierItem.name = carrierItem.name;
						ret.push(carrierItem);
					});
					response(ret);
				}
			}
		});
		}
	},
	length : 2,
	focus : function(event, ui) {
		$("#airline2").val(ui.item.name);
		return false;
	},
	select : function(event, ui) {
		$("#airline2").val(ui.item.name);
		return false;
	},
	
}).data("ui-autocomplete")._renderItem = function(ul, item) {
	var element = "<img src='/img/plane.png' style='max-width: 80%;max-height: 80%;background:none;border:none'/>";
	return $(
			"<li class='sugguest-plane' style='padding: 10px 0px 0px 5px; list-style: none; word-break: break-all;'>")
			.append(element)
			.append(item.name).appendTo(ul);
};

$("#airline3").autocomplete({
	source : function(request, response) {
		var searchTerm = request.term.toLowerCase();
		if(searchTerm.length > 2){
			$("#airline3").val("");
		}
		else if(searchTerm.length == 2){
		$.post({
			url : "/carrier",
			data : {
				parameter : searchTerm
			},
			dataType : "json",
			success : function(data) {
				var ret = [];
				if (data.length == 0) {
					$("#airline3").val("");
				} else {
					$.each(data, function(i, carrierItem) {
						carrierItem.name = carrierItem.name;
						ret.push(carrierItem);
					});
					response(ret);
				}
			}
		});
		}
	},
	length : 2,
	focus : function(event, ui) {
		$("#airline3").val(ui.item.name);
		return false;
	},
	select : function(event, ui) {
		$("#airline3").val(ui.item.name);
		return false;
	},
	
}).data("ui-autocomplete")._renderItem = function(ul, item) {
	var element = "<img src='/img/plane.png' style='max-width: 80%;max-height: 80%;background:none;border:none'/>";
	return $(
			"<li class='sugguest-plane' style='padding: 10px 0px 0px 5px; list-style: none; word-break: break-all;'>")
			.append(element)
			.append(item.name).appendTo(ul);
};

$("#airline-alliance").autocomplete({
	source : airlineAlliance
});

function sb_openleft() {

	document.getElementById("sidebar-lf").style.display = "block";
	document.getElementById("sidebar-lf").style.position = "fixed";
	document.getElementById("sidebar-lf").style.top = "0";
	document.getElementById("sidebar-lf").style.right = "0px";
	document.getElementById("sidebar-lf").style.zIndex = "10000";
	document.getElementById("icon-close-left").style.display = "block";
	document.getElementById("page-top").style.overflow = "hidden";
	document.getElementById("overlay-disable").style.display = "block";

}

function sb_closeleft() {
	document.getElementById("sidebar-lf").style.display = "none";
	document.getElementById("sidebar-lf").removeAttribute("style");
	document.getElementById("page-top").removeAttribute("style");
	document.getElementById("overlay-disable").removeAttribute("style");
	document.getElementById("icon-close-left").removeAttribute("style");

}

function sb_openbasket() {
	document.getElementById("sb").style.display = "block";
	document.getElementById("sb").style.position = "fixed";
	document.getElementById("sb").style.overflowX = "auto";
	document.getElementById("sb").style.right = "0px";
	document.getElementById("sb").style.top = "0px";
	document.getElementById("btn_show_basket").style.display = "none";
	document.getElementById("overlay-disable").style.display = "block";
}

function sb_closebasket() {
	document.getElementById("sb").style.display = "none";
	document.getElementById("sb").removeAttribute("style");
	document.getElementById("btn_show_basket").style.display = "block";
	document.getElementById("overlay-disable").removeAttribute("style");
}

function sb_closeall() {
	var sidebarlf = document.getElementById("sidebar-lf").style.display;
	var sidebarrg = document.getElementById("sb").style.display;
	if (sidebarlf == "block") {
		sb_closeleft()
	}

	if (sidebarrg == "block") {
		sb_closebasket();
	}

}

function changeDepartArrival() {
	var depart = $('#inf-depart-city-input').val();
	var arrival = $('#inf-arrival-city-input').val();

	$('#inf-depart-city-input').val(arrival);
	$('#inf-arrival-city-input').val(depart);
};

var options = $.extend({}, // empty object
$.datepicker.regional['ja'], {
	numberOfMonths : 2,
	showButtonPanel : true,
	firstDay : 0,
	minDate : currentDate,
	beforeShowDay : function(date) {
		var datecheck = date.toString();
		var highlight = eventDates[date];
		if (date.getDay() == 0 || highlight) {
			return [ true, "event", datecheck ];
		}
		if (date.getDay() == 6) {
			return [ true, "event2", datecheck ];
		} else {
			return [ true, '', '' ];
		}
	},

});

$.datepicker.regional['ja'] = {
	closeText : '閉じる',
	prevText : '<前',
	nextText : '次>',
	currentText : '今日',
	monthNames : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月',
			'11月', '12月' ],
	monthNamesShort : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月',
			'10月', '11月', '12月' ],
	dayNames : [ '日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日' ],
	dayNamesShort : [ '日', '月', '火', '水', '木', '金', '土' ],
	dayNamesMin : [ '日', '月', '火', '水', '木', '金', '土' ],
	weekHeader : '週',
	dateFormat : 'yy/mm/dd (D)',
	isRTL : false,
	showMonthAfterYear : true,
	yearSuffix : '年'
};
$.datepicker.setDefaults($.datepicker.regional['ja']);

$('#inf-date-input').datepicker(options);

$(".flight-ponter-click").click(function() {
	$(this).closest(".result-item").toggleClass("item-open");
});

$(".toggle-icon").click(function() {
	$(this).closest(".result-item").toggleClass("item-open");
});

$(".icon-close-basket-right").click(function() {
	$(this).closest(".basket-item").toggleClass("is-disable");
});

$(".option-show-hiden").click(function() {
	$("#showsearch").toggle();
});

$("#from-slider-range").slider({
	range : true,
	min : 0,
	max : 1439,
	step : 30,
	values : [ 0, 1439 ],
	slide : function(e, ui) {
		var start_hours = Math.floor(ui.values[0] / 60);
		var start_minutes = ui.values[0] - (start_hours * 60);

		if (start_hours.length == 1)
			start_hours = '0' + start_hours;
		if (start_minutes.length == 1)
			start_minutes = '0' + start_minutes;
		if (start_hours < 10)
			start_hours = '0' + start_hours;
		if (start_minutes < 10)
			start_minutes = '0' + start_minutes;

		$('.from-slider-time-start').html(start_hours + ':' + start_minutes);

		var end_hours = Math.floor(ui.values[1] / 60);
		var end_minutes = ui.values[1] - (end_hours * 60);

		if (end_hours.length == 1)
			end_hours = '00' + end_hours;
		if (end_minutes.length == 1)
			end_minutes = '00' + end_minutes;
		if (end_hours < 10)
			end_hours = '0' + end_hours;
		if (end_minutes < 10)
			end_minutes = '0' + end_minutes;

		$('.from-slider-time-end').html(end_hours + ':' + end_minutes);
	}
});

$("#to-slider-range").slider({
	range : true,
	min : 0,
	max : 1439,
	step : 30,
	values : [ 0, 1439 ],
	slide : function(e, ui) {
		var start_hours = Math.floor(ui.values[0] / 60);
		var start_minutes = ui.values[0] - (start_hours * 60);

		if (start_hours.length == 1)
			start_hours = '00' + start_hours;
		if (start_minutes.length == 1)
			start_minutes = '00' + start_minutes;
		if (start_hours < 10)
			start_hours = '0' + start_hours;
		if (start_minutes < 10)
			start_minutes = '0' + start_minutes;

		$('.to-slider-time-start').html(start_hours + ':' + start_minutes);

		var end_hours = Math.floor(ui.values[1] / 60);
		var end_minutes = ui.values[1] - (end_hours * 60);

		if (end_hours.length == 1)
			end_hours = '00' + end_hours;
		if (end_minutes.length == 1)
			end_minutes = '00' + end_minutes;
		if (end_hours < 10)
			end_hours = '0' + end_hours;
		if (end_minutes < 10)
			end_minutes = '0' + end_minutes;

		$('.to-slider-time-end').html(end_hours + ':' + end_minutes);
	}
});

$(document)
		.ready(
				function() {

					$("#inf-date-input").datepicker("setDate", currentDate);

					$("#icon-add-flight")
							.on(
									"click",
									function() {

										var card_ouput = "";
										if (1 === 1) {

											card_ouput += "<div class=\"basket-item\">"
											card_ouput += "<div class=\"col_sum\"> "
											card_ouput += "<table class=\"clear_padding clear_border\">"
											card_ouput += "<tbody> "
											card_ouput += "<tr class=\"clear_border\"> "
											card_ouput += "<td class=\"clear_border_left clear_border_top padding_bottom_2_px\"> "
											card_ouput += "<b><span>全日本空輸</span>&nbsp;&nbsp;<span>NH111</span></b> "
											card_ouput += "</td> "
											card_ouput += "<td rowspan=\"2\" class=\"clear_border_top clear_border_right clear_border_bottom\">"
											card_ouput += "<span class=\"icon-close-basket-right\">"
											card_ouput += "<i class=\"fas fa-times\"></i>"
											card_ouput += "</span> "
											card_ouput += "</td> "
											card_ouput += "</tr> "
											card_ouput += "<tr class=\"clear_border only_border_top\"> "
											card_ouput += "<td class=\"clear_border_bottom clear_border_left padding_top_5_px\" style=\"padding-left: 12px\"> "
											card_ouput += "<span><i class=\"fas fa-plane-departure\"></i> &nbsp;&nbsp; "
											card_ouput += "12/31(水) 12:00 HND</span>"
											card_ouput += "<br>"
											card_ouput += "&nbsp;<i class=\"fas fa-long-arrow-alt-down\"></i>"
											card_ouput += "<br>"
											card_ouput += "<span><i class=\"fas fa-plane-arrival\"></i> &nbsp;&nbsp; "
											card_ouput += "01/01(木) 15:00 SIN</span>"
											card_ouput += "</td> "
											card_ouput += " "
											card_ouput += "</tr> "
											card_ouput += "</tbody>"
											card_ouput += "</table>"
											card_ouput += "</div>"
											card_ouput += "<div class=\"line\"></div>"
											card_ouput += "</div>"

										}

										$(".basket-right-list").append(
												card_ouput);

									});

					$("#icon-add-flight2")
							.on(
									"click",
									function() {

										var card_ouput = "";
										if (1 === 1) {
											card_ouput += "<div class=\"basket-item\"> "
											card_ouput += "<div class=\"col_sum\"> "
											card_ouput += "<table class=\"clear_padding clear_border\">"
											card_ouput += "<tbody> "
											card_ouput += "<tr>"
											card_ouput += "<td "
											card_ouput += "class=\"clear_border_left clear_border_top padding_bottom_2_px\"> "
											card_ouput += "<b>全日本空輸　NH111</b> "
											card_ouput += "</td> "
											card_ouput += "<td rowspan=\"5\" "
											card_ouput += "class=\"clear_border_top clear_border_right clear_border_bottom\">"
											card_ouput += "<span class=\"icon-close-basket-right\">"
											card_ouput += "<i class=\"fas fa-times\"></i>"
											card_ouput += "</span> "
											card_ouput += "</td> "
											card_ouput += "</tr> "
											card_ouput += "<tr class=\"clear_border only_border_top\"> "
											card_ouput += "<td class=\"clear_border_bottom clear_border_left padding_top_5_px\""
											card_ouput += "style=\"padding-left: 12px\"> "
											card_ouput += "<span><i class=\"fas fa-plane-departure\"></i> &nbsp;&nbsp; "
											card_ouput += "12/31(水) 12:00 HND</span>"
											card_ouput += "<br>"
											card_ouput += "&nbsp;<i class=\"fas fa-long-arrow-alt-down\"></i>"
											card_ouput += "<br>"
											card_ouput += "<span><i class=\"fas fa-plane-arrival\"></i> &nbsp;&nbsp; "
											card_ouput += "01/01(木) 15:00 SIN</span>"
											card_ouput += "</td> "
											card_ouput += "</tr> "
											card_ouput += "<tr>"
											card_ouput += "<td "
											card_ouput += "class=\"clear_border_bottom clear_border_left clear_border_top padding_top_5_px padding_bottom_5_px\">"
											card_ouput += "<span style=\"color: #00BDB4\"><i "
											card_ouput += "class=\"fas fa-random\"></i><b>&nbsp;&nbsp;乗継</b></span>"
											card_ouput += "</td> "
											card_ouput += "</tr> "
											card_ouput += "<tr>"
											card_ouput += "<td "
											card_ouput += "class=\"clear_border_left clear_border_top padding_bottom_2_px\"> "
											card_ouput += "<b>全日本空輸　NH111</b> "
											card_ouput += "</td> "
											card_ouput += "</tr> "
											card_ouput += "<tr>"
											card_ouput += "<td class=\"clear_border_bottom clear_border_left padding_top_5_px\""
											card_ouput += "style=\"padding-left: 12px\"> "
											card_ouput += "<span><i class=\"fas fa-plane-departure\"></i> &nbsp;&nbsp; "
											card_ouput += "12/31(水) 12:00 HND</span>"
											card_ouput += "<br>"
											card_ouput += "&nbsp;<i class=\"fas fa-long-arrow-alt-down\"></i>"
											card_ouput += "<br>"
											card_ouput += "<span><i class=\"fas fa-plane-arrival\"></i> &nbsp;&nbsp; "
											card_ouput += "01/01(木) 15:00 SIN</span>"
											card_ouput += "</td> "
											card_ouput += "</tr> "
											card_ouput += "</tbody>"
											card_ouput += "</table>"
											card_ouput += "</div>"
											card_ouput += "<div class=\"line\"></div>"
											card_ouput += "</div>"

										}

										$(".basket-right-list").append(
												card_ouput);

									});

				});
