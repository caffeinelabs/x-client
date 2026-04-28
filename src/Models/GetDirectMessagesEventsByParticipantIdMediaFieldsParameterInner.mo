import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner.mo
/// Enum values: #alt_text, #duration_ms, #height, #media_key, #non_public_metrics, #organic_metrics, #preview_image_url, #promoted_metrics, #public_metrics, #type_, #url, #variants, #width

module {
    public type GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner = {
        #alt_text;
        #duration_ms;
        #height;
        #media_key;
        #non_public_metrics;
        #organic_metrics;
        #preview_image_url;
        #promoted_metrics;
        #public_metrics;
        #type_;
        #url;
        #variants;
        #width;
    };

    public module JSON {
        public func toCandidValue(value : GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#alt_text) #Text("alt_text");
                case (#duration_ms) #Text("duration_ms");
                case (#height) #Text("height");
                case (#media_key) #Text("media_key");
                case (#non_public_metrics) #Text("non_public_metrics");
                case (#organic_metrics) #Text("organic_metrics");
                case (#preview_image_url) #Text("preview_image_url");
                case (#promoted_metrics) #Text("promoted_metrics");
                case (#public_metrics) #Text("public_metrics");
                case (#type_) #Text("type");
                case (#url) #Text("url");
                case (#variants) #Text("variants");
                case (#width) #Text("width");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner =
            switch (candid) {
                case (#Text("alt_text")) ?#alt_text;
                case (#Text("duration_ms")) ?#duration_ms;
                case (#Text("height")) ?#height;
                case (#Text("media_key")) ?#media_key;
                case (#Text("non_public_metrics")) ?#non_public_metrics;
                case (#Text("organic_metrics")) ?#organic_metrics;
                case (#Text("preview_image_url")) ?#preview_image_url;
                case (#Text("promoted_metrics")) ?#promoted_metrics;
                case (#Text("public_metrics")) ?#public_metrics;
                case (#Text("type")) ?#type_;
                case (#Text("url")) ?#url;
                case (#Text("variants")) ?#variants;
                case (#Text("width")) ?#width;
                case _ null;
            };

        public func toText(value : GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner) : Text =
            switch (value) {
                case (#alt_text) "alt_text";
                case (#duration_ms) "duration_ms";
                case (#height) "height";
                case (#media_key) "media_key";
                case (#non_public_metrics) "non_public_metrics";
                case (#organic_metrics) "organic_metrics";
                case (#preview_image_url) "preview_image_url";
                case (#promoted_metrics) "promoted_metrics";
                case (#public_metrics) "public_metrics";
                case (#type_) "type";
                case (#url) "url";
                case (#variants) "variants";
                case (#width) "width";
            };
    };
};
