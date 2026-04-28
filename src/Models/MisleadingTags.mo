/// Community Note misleading tags type.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// MisleadingTags.mo
/// Enum values: #disputed_claim_as_fact, #factual_error, #manipulated_media, #misinterpreted_satire, #missing_important_context, #other, #outdated_information

module {
    public type MisleadingTags = {
        #disputed_claim_as_fact;
        #factual_error;
        #manipulated_media;
        #misinterpreted_satire;
        #missing_important_context;
        #other;
        #outdated_information;
    };

    public module JSON {
        public func toCandidValue(value : MisleadingTags) : Candid.Candid =
            switch (value) {
                case (#disputed_claim_as_fact) #Text("disputed_claim_as_fact");
                case (#factual_error) #Text("factual_error");
                case (#manipulated_media) #Text("manipulated_media");
                case (#misinterpreted_satire) #Text("misinterpreted_satire");
                case (#missing_important_context) #Text("missing_important_context");
                case (#other) #Text("other");
                case (#outdated_information) #Text("outdated_information");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?MisleadingTags =
            switch (candid) {
                case (#Text("disputed_claim_as_fact")) ?#disputed_claim_as_fact;
                case (#Text("factual_error")) ?#factual_error;
                case (#Text("manipulated_media")) ?#manipulated_media;
                case (#Text("misinterpreted_satire")) ?#misinterpreted_satire;
                case (#Text("missing_important_context")) ?#missing_important_context;
                case (#Text("other")) ?#other;
                case (#Text("outdated_information")) ?#outdated_information;
                case _ null;
            };

        public func toText(value : MisleadingTags) : Text =
            switch (value) {
                case (#disputed_claim_as_fact) "disputed_claim_as_fact";
                case (#factual_error) "factual_error";
                case (#manipulated_media) "manipulated_media";
                case (#misinterpreted_satire) "misinterpreted_satire";
                case (#missing_important_context) "missing_important_context";
                case (#other) "other";
                case (#outdated_information) "outdated_information";
            };
    };
};
