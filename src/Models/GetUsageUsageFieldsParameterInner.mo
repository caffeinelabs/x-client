import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GetUsageUsageFieldsParameterInner.mo
/// Enum values: #cap_reset_day, #daily_client_app_usage, #daily_project_usage, #project_cap, #project_id, #project_usage

module {
    public type GetUsageUsageFieldsParameterInner = {
        #cap_reset_day;
        #daily_client_app_usage;
        #daily_project_usage;
        #project_cap;
        #project_id;
        #project_usage;
    };

    public module JSON {
        public func toCandidValue(value : GetUsageUsageFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#cap_reset_day) #Text("cap_reset_day");
                case (#daily_client_app_usage) #Text("daily_client_app_usage");
                case (#daily_project_usage) #Text("daily_project_usage");
                case (#project_cap) #Text("project_cap");
                case (#project_id) #Text("project_id");
                case (#project_usage) #Text("project_usage");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetUsageUsageFieldsParameterInner =
            switch (candid) {
                case (#Text("cap_reset_day")) ?#cap_reset_day;
                case (#Text("daily_client_app_usage")) ?#daily_client_app_usage;
                case (#Text("daily_project_usage")) ?#daily_project_usage;
                case (#Text("project_cap")) ?#project_cap;
                case (#Text("project_id")) ?#project_id;
                case (#Text("project_usage")) ?#project_usage;
                case _ null;
            };

        public func toText(value : GetUsageUsageFieldsParameterInner) : Text =
            switch (value) {
                case (#cap_reset_day) "cap_reset_day";
                case (#daily_client_app_usage) "daily_client_app_usage";
                case (#daily_project_usage) "daily_project_usage";
                case (#project_cap) "project_cap";
                case (#project_id) "project_id";
                case (#project_usage) "project_usage";
            };
    };
};
