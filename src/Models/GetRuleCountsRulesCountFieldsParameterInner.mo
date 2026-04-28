import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetRuleCountsRulesCountFieldsParameterInner.mo
/// Enum values: #all_project_client_apps, #cap_per_client_app, #cap_per_project, #client_app_rules_count, #project_rules_count

module {
    public type GetRuleCountsRulesCountFieldsParameterInner = {
        #all_project_client_apps;
        #cap_per_client_app;
        #cap_per_project;
        #client_app_rules_count;
        #project_rules_count;
    };

    public module JSON {
        public func toCandidValue(value : GetRuleCountsRulesCountFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#all_project_client_apps) #Text("all_project_client_apps");
                case (#cap_per_client_app) #Text("cap_per_client_app");
                case (#cap_per_project) #Text("cap_per_project");
                case (#client_app_rules_count) #Text("client_app_rules_count");
                case (#project_rules_count) #Text("project_rules_count");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetRuleCountsRulesCountFieldsParameterInner =
            switch (candid) {
                case (#Text("all_project_client_apps")) ?#all_project_client_apps;
                case (#Text("cap_per_client_app")) ?#cap_per_client_app;
                case (#Text("cap_per_project")) ?#cap_per_project;
                case (#Text("client_app_rules_count")) ?#client_app_rules_count;
                case (#Text("project_rules_count")) ?#project_rules_count;
                case _ null;
            };

        public func toText(value : GetRuleCountsRulesCountFieldsParameterInner) : Text =
            switch (value) {
                case (#all_project_client_apps) "all_project_client_apps";
                case (#cap_per_client_app) "cap_per_client_app";
                case (#cap_per_project) "cap_per_project";
                case (#client_app_rules_count) "client_app_rules_count";
                case (#project_rules_count) "project_rules_count";
            };
    };
};
