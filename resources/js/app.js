/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require("./bootstrap");

$(function() {
    $.ajaxSetup({
        headers: {
            "X-CSRF-TOKEN": $("meta[name=\"csrf-token\"]").attr("content")
        }
    });

    /** Default configuration for ajax calls */
    var ajaxConfig = function() {
        this.url      = "";
        this.method   = "GET";
        this.dataType = "json";
        this.async    = true;
        this.data     = {};
    };

    /**
     *
     * @param config //Instance of ajaxConfig
     * @returns {*}
     */
    function executeAjax(config) {
        if (typeof config !== "object" || !config instanceof ajaxConfig) {
            throw "Parameter config must be an instance of ajaxConfig";
        }

        return $.ajax({
            url: config.url,
            async: config.async,
            method: config.method,
            data: config.data,
            dataType: config.dataType
        }).done(function(response) {
            return response;
        });
    }

    $(document).on("show.bs.modal", "#server-modal", function(event) {
        var modal    = $(this);
        var serverId = Number($(event.relatedTarget).data("server-id"));

        if (serverId <= 0) {
            return;
        }

        var config = new ajaxConfig();

        config.url  = "/admin/servers";
        config.data = {"server_id": serverId};

        /** Send request to retrieve the Server form */
        executeAjax(config).then(function(response) {
            if (!response.hasOwnProperty("success") || !response.success) {
                return;
            }

            if (response.hasOwnProperty("form")) {
                modal.find("#loader").addClass("d-none");
                modal.find("#form-container").html(response.form);
                modal.find("#save-server-config").off("click").on("click", postServerConfiguration);
            }
        });
    }).on("hidden.bs.modal", "#server-modal", function() {
        $(this).find("#form-container").empty();
        $(this).find("#loader").removeClass("d-none");
    });

    /**
     * Send POST/PUT request to store or update a Server
     * @param event
     */
    function postServerConfiguration(event) {
        var modal    = $("#server-modal");
        var saveBtn  = $(event.target);
        var saveText = saveBtn.text();
        var form     = $("#server-form");
        saveBtn.html($("<i class='fas fa-spinner fa-pulse'>"));
        saveBtn.prop("disabled", true);

        var config = new ajaxConfig();

        config.url    = "/admin/servers";
        config.data   = form.serializeArray();
        config.method = "POST";

        if (Number(form.find("input[name='server_id']").val()) > 0) {
            config.method = "PUT";
        }

        executeAjax(config).then(function(response) {
            if (!response.hasOwnProperty("success")) {
                return;
            }

            if (!response.success && response.hasOwnProperty("form")) {
                modal.find("#form-container").html(response.form);

                return;
            }

            if (response.success) {
                modal.modal("hide");
            }
        }).then(function() {
            saveBtn.prop("disabled", false).html(saveText);
        });
    }
});
