// Generated by CoffeeScript 1.10.0
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  App.ConfirmationView = (function(superClass) {
    extend(ConfirmationView, superClass);

    function ConfirmationView() {
      this.confirmSubmission = bind(this.confirmSubmission, this);
      return ConfirmationView.__super__.constructor.apply(this, arguments);
    }

    ConfirmationView.prototype.tpl = null;

    ConfirmationView.prototype.model = null;

    ConfirmationView.prototype.collection = null;

    ConfirmationView.prototype.hideOnEmpty = false;

    ConfirmationView.prototype.initialize = function(options) {
      if (options == null) {
        options = {};
      }
      if (options.model) {
        this.model = options.model;
      }
      if (options.tpl) {
        this.tpl = options.tpl;
      }
      if (options.type) {
        this.type = options.type;
      }
      if (options.rootElement) {
        return this.rootElement = options.rootElement;
      }
    };

    ConfirmationView.prototype.events = {
      'click #cancel-button': 'cancelSubmission',
      'click #confirm-button': 'confirmSubmission'
    };

    ConfirmationView.prototype.render = function() {
      var content;
      content = this.template({
        payment: this.model,
        type: this.type
      });
      this.$el.html(content);
      return ($(this.el)).appendTo(this.rootElement);
    };

    ConfirmationView.prototype.cancelSubmission = function() {
      var p, template;
      if (this.type === 'BTC') {
        template = "btc-form";
      } else if (this.type === 'XWBC') {
        template = "xwbc-form";
      } else if (this.type === 'EU') {
        template = "bank-form";
      } else if (this.type === 'Inter') {
        template = "bank-form";
      }
      p = new App.WithdrawalView({
        model: this.model,
        tpl: template,
        type: this.type
      });
      p.render();
      return this.close();
    };

    ConfirmationView.prototype.confirmSubmission = function() {
      var template;
      if (this.type === 'BTC') {
        template = "btc-form";
      } else if (this.type === 'XWBC') {
        template = "xwbc-form";
      } else if (this.type === 'EU') {
        template = "bank-form";
      } else if (this.type === 'Inter') {
        template = "bank-form";
      }
      this.model.save(null, {
        success: (function(_this) {
          return function() {
            var p;
            p = new App.WithdrawalView({
              model: null,
              tpl: template,
              type: _this.type
            });
            p.render();
            $.publish("notice", "Your withdrawal will be processed soon.");
            return $.publish("payment-submited", _this.model);
          };
        })(this),
        error: (function(_this) {
          return function(m, xhr) {
            var k;
            k = new App.WithdrawalView({
              model: _this.model,
              tpl: template,
              type: _this.type
            });
            k.render();
            return $.publish("error", xhr);
          };
        })(this)
      });
      return this.close();
    };

    return ConfirmationView;

  })(App.MasterView);

}).call(this);
