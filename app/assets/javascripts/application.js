// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require moment/es
//= require ckeditor/init
//= require d3.v3
//= require nv.d3
//= require highcharts


function create_bar_chart(data, target, xlabel, ylabel) {
    var default_ylabel = "Cantidad";
    $(target + " svg").empty();
    nv.addGraph(function() {
        var chart = nv.models.multiBarChart()
            .rotateLabels(0)
            .showControls(true)
            .groupSpacing(0.1)
            .noData('No hay datos en este periodo')
            .forceY([0,5]);

        chart.tooltip.enabled();

        chart.options({
            showControls: false,
            showLegend: true
        });

        chart.yAxis
            .axisLabel(ylabel || default_ylabel)
            .tickFormat(d3.format(',.0'));

        chart.xAxis.axisLabel(xlabel).center;

        d3.select(target + " svg")
            .datum([data])
            .transition()
            .duration(500)
            .call(chart);

        nv.utils.windowResize(chart.update);
        chart.update;
        return chart;
    });
}
