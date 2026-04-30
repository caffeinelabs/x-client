/// A count of user-provided stream filtering rules at the application and project levels.

import { type AppRulesCount; JSON = AppRulesCount } "./AppRulesCount";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// RulesCount.mo

module {
    public type RulesCount = {
        /// Client App Rule Counts for all applications in the project
        all_project_client_apps : ?[AppRulesCount];
        /// Cap of number of rules allowed per client application
        cap_per_client_app : ?Int;
        /// Cap of number of rules allowed per project
        cap_per_project : ?Int;
        client_app_rules_count : ?AppRulesCount;
        /// Number of rules for project
        project_rules_count : ?Int;
    };

    public module JSON {
        // `init` constructs a RulesCount from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { RulesCount.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : RulesCount {
            let ?res = from_candid(to_candid(required)) : ?RulesCount else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : RulesCount) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.all_project_client_apps) {
                case (?v__) List.add(buf, ("all_project_client_apps", #Array(Array.map<AppRulesCount, Candid.Candid>(v__, AppRulesCount.toCandidValue))));
                case null ();
            };
            switch (value.cap_per_client_app) {
                case (?v__) List.add(buf, ("cap_per_client_app", #Int(v__)));
                case null ();
            };
            switch (value.cap_per_project) {
                case (?v__) List.add(buf, ("cap_per_project", #Int(v__)));
                case null ();
            };
            switch (value.client_app_rules_count) {
                case (?v__) List.add(buf, ("client_app_rules_count", AppRulesCount.toCandidValue(v__)));
                case null ();
            };
            switch (value.project_rules_count) {
                case (?v__) List.add(buf, ("project_rules_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?RulesCount =
            switch (candid) {
                case (#Record(fields)) {
                    let all_project_client_apps : ?[AppRulesCount] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "all_project_client_apps")) {
                        case (?all_project_client_apps_field) ((switch (all_project_client_apps_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<AppRulesCount>();
                            for (c__ in xs__.values()) {
                                let ?m__ = AppRulesCount.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let cap_per_client_app : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "cap_per_client_app")) {
                        case (?cap_per_client_app_field) ((switch (cap_per_client_app_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let cap_per_project : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "cap_per_project")) {
                        case (?cap_per_project_field) ((switch (cap_per_project_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let client_app_rules_count : ?AppRulesCount = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "client_app_rules_count")) {
                        case (?client_app_rules_count_field) (AppRulesCount.fromCandidValue(client_app_rules_count_field.1));
                        case null null;
                    };
                    let project_rules_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "project_rules_count")) {
                        case (?project_rules_count_field) ((switch (project_rules_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        all_project_client_apps;
                        cap_per_client_app;
                        cap_per_project;
                        client_app_rules_count;
                        project_rules_count;
                    };
                };
                case _ null;
            };
    };
};
