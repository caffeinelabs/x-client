import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetWebhooksWebhookConfigFieldsParameterInner.mo
/// Enum values: #created_at, #id, #url, #valid

module {
    public type GetWebhooksWebhookConfigFieldsParameterInner = {
        #created_at;
        #id;
        #url;
        #valid;
    };

    public module JSON {
        public func toCandidValue(value : GetWebhooksWebhookConfigFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#created_at) #Text("created_at");
                case (#id) #Text("id");
                case (#url) #Text("url");
                case (#valid) #Text("valid");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetWebhooksWebhookConfigFieldsParameterInner =
            switch (candid) {
                case (#Text("created_at")) ?#created_at;
                case (#Text("id")) ?#id;
                case (#Text("url")) ?#url;
                case (#Text("valid")) ?#valid;
                case _ null;
            };

        public func toText(value : GetWebhooksWebhookConfigFieldsParameterInner) : Text =
            switch (value) {
                case (#created_at) "created_at";
                case (#id) "id";
                case (#url) "url";
                case (#valid) "valid";
            };
    };
};
