// Generated by CoffeeScript 1.10.0
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  App.TradeChartView = (function(superClass) {
    extend(TradeChartView, superClass);

    function TradeChartView() {
      return TradeChartView.__super__.constructor.apply(this, arguments);
    }

    TradeChartView.prototype.collection = null;

    TradeChartView.prototype.initialize = function(options) {
      if (options == null) {
        options = {};
      }
    };

    TradeChartView.prototype.render = function() {
      return this.collection.fetch({
        success: (function(_this) {
          return function() {
            return _this.renderChart(_this.collection.toJSON());
          };
        })(this)
      });
    };

    TradeChartView.prototype.renderChart = function(data) {
      var dataLength, i, ohlc, startTime, volume, xAxis;
      ohlc = [];
      volume = [];
      xAxis = [];
      dataLength = data.length;
      i = 0;
      while (i < dataLength) {
        startTime = new Date(data[i].start_time).getTime();
        ohlc.push([startTime, data[i].open_price, data[i].high_price, data[i].low_price, data[i].close_price]);
        volume.push([startTime, data[i].volume]);
        i++;
      }
      return this.$el.highcharts("StockChart", {
        rangeSelector: {
          enabled: false
        },
        scrollbar: {
          enabled: false
        },
        navigator: {
          enabled: false
        },
        exporting: {
          buttons: [
            {
              printButton: {
                enabled: false
              },
              exportButton: {
                enabled: false
              }
            }
          ]
        },
        credits: {
          enabled: false
        },
        yAxis: [
          {
            lineWidth: 0,
            gridLineColor: "#ecedef"
          }, {
            gridLineWidth: 0,
            opposite: true
          }
        ],
        xAxis: {
          lineColor: "#ecedef",
          type: "time",
          dateTimeLabelFormats: {
            millisecond: '%H:%M'
          }
        },
        tooltip: {
          shared: true,
          shadow: false,
          backgroundColor: "#ffffff",
          borderColor: "#d1d5dd",
          formatter: function() {
            var s;
            s = Highcharts.dateFormat('%b %e %Y %H:%M', this.x) + "<br />";
            s += "<b>Open:</b> " + _.str.toFixed(this.points[1].point.open) + "<br />";
            s += "<b>High:</b> " + _.str.toFixed(this.points[1].point.high) + "<br />";
            s += "<b>Low:</b> " + _.str.toFixed(this.points[1].point.low) + "<br />";
            s += "<b>Close:</b> " + _.str.toFixed(this.points[1].point.close) + "<br />";
            s += "<b>Volume:</b> " + _.str.toFixed(this.points[0].point.y);
            return s;
          }
        },
        series: [
          {
            type: "column",
            name: "Volume",
            data: volume,
            yAxis: 1,
            color: "#dddddd"
          }, {
            type: "candlestick",
            name: "Price",
            data: ohlc,
            yAxis: 0,
            color: "#3eae5f",
            upColor: "#da4444",
            lineColor: "#3eae5f",
            upLineColor: "#da4444",
            borderWidth: 0
          }
        ]
      });
    };

    return TradeChartView;

  })(App.MasterView);

}).call(this);
