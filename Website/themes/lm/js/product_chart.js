$(document).ready(function () {

           $("#fanxiucontainer").highcharts({
                chart: {
                    type: "column",
                    marginRight: 0,
                    marginBottom: 25
                },
                title: {
                    text: "使用不同骨水泥的翻修风险",
                    x: -20 //center
                },
                subtitle: {
                    text: "与Sulfix 相比，含庆大霉素的PALACOS R+G返修率降低了51%",
                    x: -20
                },
                xAxis: {
                    categories: ["PALACOS R+G", "PALACOS R", "Simplex ", "CMW ","Sulfix "]
                },
                yAxis: {
                    title: {
                        text: "Risk of revision"
                    },
                    tickPositions: [0.4, 0.5, 0.6, 0.7,0.8,0.9,1],
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: "#808080"
                    }]
                },
                tooltip: {
                    formatter: function () {
                        return this.x + ": " + (this.y*100) + "%";
                    }
                },
                credits: {          enabled:0},
                legend: {
                    enabled: 0
                },
                series: [{
                    data: [{ "color": "#70BC2C", "y": 0.47 },
                                { "color": "#70BC2C", "y": 0.49 },
                                { "color": "#cccccc", "y": 0.59 },
                                { "color": "#cccccc", "y": 0.71 },
                                { "color": "#cccccc", "y": 1 }],
                }]
            });
            $("#qingdacontainer").highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: "庆大霉素活性谱"
                },
                tooltip: {
                    pointFormat: "<b>{point.percentage:.1f}%</b>"
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: "pointer",
                        dataLabels: {
                            enabled: false
                        },
                        showInLegend: true
                    }
                },
                credits: {          enabled:0},
                series: [{
                    type: "pie",
                    name: "Browser share",
                    data: [
                        {"color": "#F4F8E4","name":"假单胞菌属",   y:7.0},
                        {"color": "#9B9C9C","name":"肠杆菌",   y:12.0},
                        {"color": "#BBBBBB","name":"凝血酶阴性葡萄球菌",   y:18.0},
                        {"color": "#E1E1E2","name":"金换色葡萄球菌",   y:28.0},
                        {"color": "#B5D561","name":"链球菌属",   y:12},
                        {"color": "#D7E6A1","name":"厌氧微生物",   y:18},
                        {"color": "#E7F1C6","name":"其它",   y: 5} ]
                		}]
            });

            $("#nianducontainer").highcharts({
            	chart: {
                    type: "spline"
                },
                title: {
                    text: "不同的PALACOS骨水泥的操作特性"
                },
                xAxis: {
                    type: "datetime",
                    tickPixelInterval: 5,
                    categories:"m",
                    title:{
						text:"操作时间（分钟）"
                    }
                },
                yAxis: {
                    title: {
                        text: "粘度"
                    },
                    tickPositions: [0,50, 100],
                    min: 0,
                    lineWidth: 2
                },
                tooltip: {
                    headerFormat: "<b>{series.name}</b><br>",
                    pointFormat: "{point.x}分钟: {point.y}%"
                },
                credits: { enabled: 0 },

                series: [{
                    name: "PALACOS R",
                    // Define the data points. All series have a dummy year
                    // of 1970/71 in order to be compared on the same x axis. Note
                    // that in JavaScript, months start at 0 for January, 1 for February etc.
                    data: [
                        [1, 11   ],
                        [3, 15 ],
                        [6, 46 ],
                        [7.5, 100 ]
                    ]
                }, {
                    name: "PALACOS MV",
                    data: [
                           [1, 10   ],
                        [3.3, 12 ],
                        [6.5, 42],
                        [8, 100]
                    ]
                }, {
                    name: "PALACOS LV",
                    data: [
                        [1, 9   ],
                        [6.1, 12],
                        [9, 38],
                        [11, 100]
                    ]
                }]
            });

            $("#naiyacontainer").highcharts({
                chart: {
                    type: "column",
                    marginRight: 0,
                    marginBottom: 25
                },
                title: {
                    text: "耐压强度（ISO 5833）",
                    x: -20 //center
                },
                subtitle: {
                    text: "70 Mpa 为ISO规定的最小值",
                    x: -20
                },
                xAxis: {
                    categories: ["R", "R+G", "MV", "MV+G", "LV","LV+G"]
                },
                yAxis: {
                    title: {
                        text: "MPa"
                    },
                    tickPositions: [0, 20, 40, 60, 80, 100],
                    plotLines: [{
                        value: 70,
                        color: "#dd0202",
                        dashStyle: "solid",
                        width: 2,
                        zIndex:100,
                        label: {
                            text: "",
                            align: "left",
                            x: -25,
                            style: {
                                color: "#dd0202"
                            }
                        }
                    }]
                },
                credits: { enabled: 0 },
                legend: {
                    enabled: 0
                },
                series: [{
                    data: [{ "color": "#E2E2E2", "y": 91 },
                                { "color": "#74C22D", "y": 89 },
                                { "color": "#C3C3C3", "y": 88 },
                                { "color": "#DFEDCA", "y": 86 },
                                { "color": "#A1A1A1", "y": 94 },
                                { "color": "#9BCF5E", "y": 89 }],
                    dataLabels: {
                        enabled: true,
                        rotation: 0,
                        color: "#262626",
                        align: "center",
                        formatter: function () {

                            if (this.y != 0) {
                                return this.y ;
                            }
                        },
                        style: {
                            fontSize: "13px",
                            fontFamily: "Microsoft YaHei"

                        }
                    }
                }]
            });


            $("#tanxingcontainer").highcharts({
                chart: {
                    type: "column",
                    marginRight: 0,
                    marginBottom: 25
                },
                title: {
                    text: "弹性模量（ISO 5833）",
                    x: -20 //center
                },
                subtitle: {
                    text: "1800 Mpa 为ISO规定的最小值",
                    x: -20
                },
                xAxis: {
                    categories: ["R", "R+G", "MV", "MV+G", "LV", "LV+G"]
                },
                yAxis: {
                    title: {
                        text: "MPa"
                    },
                    tickPositions: [0, 500, 1000, 1500, 2000,2500, 3000],
                    plotLines: [{
                        value: 1800,
                        color: "#dd0202",
                        dashStyle: "solid",
                        width: 2,
                        zIndex: 100,
                        label: {
                            text: "",
                            align: "left",
                            x: -25,
                            style: {
                                color: "#dd0202"
                            }
                        }
                    }]
                },
                credits: { enabled: 0 },
                legend: {
                    enabled: 0
                },
                series: [{
                    data: [{ "color": "#E2E2E2", "y": 2870 },
                                { "color": "#74C22D", "y": 2750 },
                                { "color": "#C3C3C3", "y": 2730 },
                                { "color": "#DFEDCA", "y": 2700 },
                                { "color": "#A1A1A1", "y": 2830 },
                                { "color": "#9BCF5E", "y": 2850 }],
                    dataLabels: {
                        enabled: true,
                        rotation: 0,
                        color: "#262626",
                        align: "center",
                        formatter: function () {

                            if (this.y != 0) {
                                return this.y;
                            }
                        },
                        style: {
                            fontSize: "13px",
                            fontFamily: "Microsoft YaHei"

                        }
                    }
                }]
            });

            $("#wanqucontainer").highcharts({
                chart: {
                    type: "column",
                    marginRight: 0,
                    marginBottom: 25
                },
                title: {
                    text: "弯曲强度（ISO 5833）",
                    x: -20 //center
                },
                subtitle: {
                    text: "50 Mpa 为ISO规定的最小值",
                    x: -20
                },
                xAxis: {
                    categories: ["R", "R+G", "MV", "MV+G", "LV", "LV+G"]
                },
                yAxis: {
                    title: {
                        text: "MPa"
                    },
                    tickPositions: [0, 20, 40, 60, 80, 100],
                    plotLines: [{
                        value: 50,
                        color: "#dd0202",
                        dashStyle: "solid",
                        width: 2,
                        zIndex: 100,
                        label: {
                            text: "",
                            align: "left",
                            x: -25,
                            style: {
                                color: "#dd0202"
                            }
                        }
                    }]
                },
                credits: { enabled: 0 },
                legend: {
                    enabled: 0
                },
                series: [{
                    data: [{ "color": "#E2E2E2", "y": 71 },
                                { "color": "#74C22D", "y": 70 },
                                { "color": "#C3C3C3", "y": 71 },
                                { "color": "#DFEDCA", "y": 68 },
                                { "color": "#A1A1A1", "y": 74 },
                                { "color": "#9BCF5E", "y": 71 }],
                    dataLabels: {
                        enabled: true,
                        rotation: 0,
                        color: "#262626",
                        align: "center",
                        formatter: function () {

                            if (this.y != 0) {
                                return this.y;
                            }
                        },
                        style: {
                            fontSize: "13px",
                            fontFamily: "Microsoft YaHei"

                        }
                    }
                }]
            });
            
            

            $("#otv_naiyacontainer").highcharts({
                chart: {
                    type: "column",
                    marginRight: 0,
                    marginBottom: 25
                },
                title: {
                    text: "耐压强度",
                    x: -20 //center
                },
                xAxis: {
                    categories: ["OSTEOPAL V", "PALACOS R"]
                },
                yAxis: {
                    title: {
                        text: "MPa"
                    },
                    tickPositions: [40,50,60,70,80,90,100],
                    plotLines: [{
                        value: 70,
                        color: "#dd0202",
                        dashStyle: "solid",
                        width: 2,
                        zIndex:100,
                        label: {
                            text: "",
                            align: "left",
                            x: -25,
                            style: {
                                color: "#dd0202"
                            }
                        }
                    }]
                },
                credits: { enabled: 0 },
                legend: {
                    enabled: 0
                },
                series: [{
                    data: [{ "color": "#75B727", "y": 87 },
                                { "color": "#C2DB9A", "y": 90.5 }],
                    dataLabels: {
                        enabled: true,
                        rotation: 0,
                        color: "#262626",
                        align: "center",
                        formatter: function () {

                            if (this.y != 0) {
                                return this.y ;
                            }
                        },
                        style: {
                            fontSize: "13px",
                            fontFamily: "Microsoft YaHei"

                        }
                    }
                }]
            });


            $("#otv_tanxingcontainer").highcharts({
                chart: {
                    type: "column",
                    marginRight: 0,
                    marginBottom: 25
                },
                title: {
                    text: "弹性模量",
                    x: -20 //center
                },
                xAxis: {
                    categories: ["OSTEOPAL V", "PALACOS R"]
                },
                yAxis: {
                    title: {
                        text: "MPa"
                    },
                    tickPositions: [ 1000, 1500, 2000,2500, 3000,3200],
                    plotLines: [{
                        value: 1800,
                        color: "#dd0202",
                        dashStyle: "solid",
                        width: 2,
                        zIndex: 100,
                        label: {
                            text: "",
                            align: "left",
                            x: -25,
                            style: {
                                color: "#dd0202"
                            }
                        }
                    }]
                },
                credits: { enabled: 0 },
                legend: {
                    enabled: 0
                },
                series: [{
                    data: [{ "color": "#75B727", "y": 3100 },
                                { "color": "#C2DB9A", "y": 2866 }],
                    dataLabels: {
                        enabled: true,
                        rotation: 0,
                        color: "#262626",
                        align: "center",
                        formatter: function () {

                            if (this.y != 0) {
                                return this.y;
                            }
                        },
                        style: {
                            fontSize: "13px",
                            fontFamily: "Microsoft YaHei"

                        }
                    }
                }]
            });

            $("#otv_wanqucontainer").highcharts({
                chart: {
                    type: "column",
                    marginRight: 0,
                    marginBottom: 25
                },
                title: {
                    text: "弯曲强度",
                    x: -20 //center
                },
                xAxis: {
                    categories: ["OSTEOPAL V", "PALACOS R"]
                },
                yAxis: {
                    title: {
                        text: "MPa"
                    },
                    tickPositions: [ 40,50, 60, 70],
                    plotLines: [{
                        value: 50,
                        color: "#dd0202",
                        dashStyle: "solid",
                        width: 2,
                        zIndex: 100,
                        label: {
                            text: "",
                            align: "left",
                            x: -25,
                            style: {
                                color: "#dd0202"
                            }
                        }
                    }]
                },
                credits: { enabled: 0 },
                legend: {
                    enabled: 0
                },
                series: [{
                    data: [{ "color": "#75B727", "y": 58 },
                                { "color": "#C2DB9A", "y": 67.6 }],
                    dataLabels: {
                        enabled: true,
                        rotation: 0,
                        color: "#262626",
                        align: "center",
                        formatter: function () {

                            if (this.y != 0) {
                                return this.y;
                            }
                        },
                        style: {
                            fontSize: "13px",
                            fontFamily: "Microsoft YaHei"

                        }
                    }
                }]
            });
            
            
            
            
            
        });