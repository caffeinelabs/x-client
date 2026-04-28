import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetInsights28HrEngagementFieldsParameterInner.mo
/// Enum values: #errors, #measurement

module {
    public type GetInsights28HrEngagementFieldsParameterInner = {
        #errors;
        #measurement;
    };

    public module JSON {
        public func toCandidValue(value : GetInsights28HrEngagementFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#errors) #Text("errors");
                case (#measurement) #Text("measurement");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetInsights28HrEngagementFieldsParameterInner =
            switch (candid) {
                case (#Text("errors")) ?#errors;
                case (#Text("measurement")) ?#measurement;
                case _ null;
            };

        public func toText(value : GetInsights28HrEngagementFieldsParameterInner) : Text =
            switch (value) {
                case (#errors) "errors";
                case (#measurement) "measurement";
            };
    };
};
