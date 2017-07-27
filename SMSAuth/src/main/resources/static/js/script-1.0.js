$(function () {
    var $smsTokens = $('#sms-tokens');
    var $loginTokens = $('#login-tokens');
    var $lastSmsToken = $('#sms-current-token');
    var $lastLoginToken = $('#login-current-token');

    var loginText = '<div>Authorization code of ${consumer.name} for ${user.username} : ***<strong>${token}</strong>*** (${createdAt})</div>';
    var loginTemplate = "<tr class='${activeTxt}'><td class='col-xs-12 col-sm-10'>"+loginText+"</td><td class='col-sm-2 hidden-xs'>${activeTxt}</td></tr>";
    $.template("loginTokenTemplate", loginTemplate);

    var smsText = '<div>Payment authorization code for account ${ibanHidden}, with amount ${amount} ${currency} : ***<strong>${token}</strong>*** (${createdAt})</div>';
    var smsTemplate = "<tr class='${activeTxt}'><td class='col-xs-12 col-sm-10'>"+smsText+"</td><td class='col-sm-2 hidden-xs'>${status}</td></tr>";
    $.template("smsTokenTemplate", smsTemplate);

    function refreshSMSTokens(callbackNotification) {
        $.get("/sms-auth/sms/token").done(function (data) {
            if (data.length) {
                $smsTokens.find('tbody').html($.tmpl("smsTokenTemplate", data));
                if(data.length > 5) {
                    $smsTokens.find('thead').addClass('shift');
                }
            } else {
                $smsTokens.find('tbody').empty();
            }
            var lastSmsToken = $lastSmsToken.text();
            $lastSmsToken.text(data[0] && data[0].status == 'INITIATED' ? data[0].token : '-');
            if (callbackNotification && $lastSmsToken.text() != '-' && lastSmsToken != $lastSmsToken.text()) callbackNotification(data[0]);
        });
    }

    function refreshLoginTokens(callbackNotification) {
        $.get("/sms-auth/login/token").done(function (data) {
            if (data.length) {
                $loginTokens.find('tbody').html($.tmpl("loginTokenTemplate", data));
                if(data.length > 5) {
                    $loginTokens.find('thead').addClass('shift');
                }
            } else {
                $loginTokens.find('tbody').empty();
            }

            var lastLoginToken = $lastLoginToken.text();
            $lastLoginToken.text(data[0] && !data[0].active ? data[0].token : '-');
            if (callbackNotification && $lastLoginToken.text() != '-' && lastLoginToken != $lastLoginToken.text()) callbackNotification(data[0]);
        });
    }

    function showNotification(title, token) {
        if (!Notification) {
            console.log('Desktop notifications not available in your browser. Try Chromium.');
            return;
        }

        var notification = new Notification(title, {
            icon: 'https://s3-eu-west-1.amazonaws.com/crowded-templates-eu/partials/custom/24hcoding_poland_2017/favicon.png?v=6f5495a',
            body: token
        });

        setTimeout(function() {
            notification.close()
        }, 5000);
    }

    //refresh sms tokens every 10s
    setInterval(function() {
        refreshSMSTokens(function (token) {
            showNotification('', $.tmpl($(smsText).text(), token)[0].textContent);
        });
    }, 6000);


    //refresh login tokens every 8s
    setInterval(function() {
        refreshLoginTokens(function (token) {
            showNotification('', $.tmpl($(loginText).text(), token)[0].textContent);
        });
    }, 5000);

    refreshSMSTokens();
    refreshLoginTokens();

    if (Notification.permission !== "granted") {
        Notification.requestPermission();
    }

});