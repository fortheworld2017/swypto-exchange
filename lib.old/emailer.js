(function() {
  var Emailer, _, emailer, exports, fs;

  emailer = require("nodemailer");

  fs = require("fs");

  _ = require("underscore");

  Emailer = (function() {
    Emailer.prototype.options = {};

    Emailer.prototype.data = {};

    Emailer.prototype.attachments = [];

    function Emailer(options, data1) {
      this.options = options;
      this.data = data1;
      this.setUrls();
    }

    Emailer.prototype.send = function(callback) {
      var attachments, html, messageData, transport;
      html = this.getHtml(this.options.template, this.data);
      attachments = this.getAttachments(html);
      messageData = {
        to: this.options.to.email,
        from: GLOBAL.appConfig().emailer.from,
        subject: this.options.subject,
        html: html,
        generateTextFromHTML: true,
        attachments: attachments
      };
      transport = this.getTransport();
      if (!GLOBAL.appConfig().emailer.enabled) {
        return callback();
      }
      return transport.sendMail(messageData, callback);
    };

    Emailer.prototype.getTransport = function() {
      return emailer.createTransport("SMTP", GLOBAL.appConfig().emailer.transport);
    };

    Emailer.prototype.getHtml = function(templateName, data) {
      var encoding, templateContent, templatePath;
      templatePath = "./views/emails/" + templateName + ".html";
      templateContent = fs.readFileSync(templatePath, encoding = "utf8");
      return _.template(templateContent, data, {
        interpolate: /\{\{(.+?)\}\}/g
      });
    };

    Emailer.prototype.getAttachments = function(html) {
      var attachment, attachments, i, len, ref;
      attachments = [];
      ref = this.attachments;
      for (i = 0, len = ref.length; i < len; i++) {
        attachment = ref[i];
        if (html.search("cid:" + attachment.cid) > -1) {
          attachments.push(attachment);
        }
      }
      return attachments;
    };

    Emailer.prototype.setUrls = function() {
      this.data.site_url = GLOBAL.appConfig().emailer.host || this.data.site_url;
      this.data.img_path = (GLOBAL.appConfig().assets_host || this.data.site_url) + "/img/email";
      return this.data.img_version = GLOBAL.appConfig().assets_key ? "?v=" + (GLOBAL.appConfig().assets_key) : "";
    };

    return Emailer;

  })();

  exports = module.exports = Emailer;

}).call(this);
