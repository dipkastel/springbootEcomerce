$(function() {
    'use strict'

    var ticksStyle = {
        fontColor : '#495057',
        fontStyle : 'bold'
    }
    var mode = 'index'
    var intersect = true

    var priceLastYear = $('#priceLastYear');
    var arrLastYear = priceLastYear[0].value.replace("[", "").replace(
        "]", "").split(",");

    var priceThisYear = $('#priceThisYear');
    var arrThisYear = priceThisYear[0].value.replace("[", "").replace(
        "]", "").split(",");

    var $salesChart = $('#sales-chart');
    // eslint-disable-next-line no-unused-vars
    var salesChart = new Chart($salesChart, {
        type : 'bar',
        data : {
            labels : [ 'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL',
                'AGU', 'SEP', 'OCT', 'NOV', 'DEC' ],
            datasets : [
                {
                    backgroundColor : '#007bff',
                    borderColor : '#007bff',
                    data : [ arrThisYear[0], arrThisYear[1],
                        arrThisYear[2], arrThisYear[3],
                        arrThisYear[4], arrThisYear[5],
                        arrThisYear[6], arrThisYear[7],
                        arrThisYear[8], arrThisYear[9],
                        arrThisYear[10], arrThisYear[11] ]
                },
                {
                    backgroundColor : '#ced4da',
                    borderColor : '#ced4da',
                    data : [ arrLastYear[0], arrLastYear[1],
                        arrLastYear[2], arrLastYear[3],
                        arrLastYear[4], arrLastYear[5],
                        arrLastYear[6], arrLastYear[7],
                        arrLastYear[8], arrLastYear[9],
                        arrLastYear[10], arrLastYear[11] ]
                } ]
        },
        options : {
            maintainAspectRatio : false,
            tooltips : {
                mode : mode,
                intersect : intersect
            },
            hover : {
                mode : mode,
                intersect : intersect
            },
            legend : {
                display : false
            },
            scales : {
                yAxes : [ {
                    // display: false,
                    gridLines : {
                        display : true,
                        lineWidth : '4px',
                        color : 'rgba(0, 0, 0, .2)',
                        zeroLineColor : 'transparent'
                    },
                    ticks : $.extend({
                        beginAtZero : true,

                        // Include a dollar sign in the ticks
                        callback : function(value) {
                            if (value >= 1000) {
                                value /= 1000
                                value += 'k'
                            }

                            return '$' + value
                        }
                    }, ticksStyle)
                } ],
                xAxes : [ {
                    display : true,
                    gridLines : {
                        display : false
                    },
                    ticks : ticksStyle
                } ]
            }
        }
    })
});

$(function() {
    $("#example1").DataTable(
        {
            "sort" : false,
            "responsive" : true,
            "lengthChange" : false,
            "autoWidth" : false,
            "buttons" : [ "copy", "csv", "excel", "pdf", "print",
                "colvis" ]
        }).buttons().container().appendTo(
        '#example1_wrapper .col-md-6:eq(0)');
});
