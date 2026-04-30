/// Usage per client app

import { type ClientAppUsage; JSON = ClientAppUsage } "./ClientAppUsage";

import { type UsageDailyProjectUsage; JSON = UsageDailyProjectUsage } "./UsageDailyProjectUsage";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Usage.mo

module {
    public type Usage = {
        /// Number of days left for the Tweet cap to reset
        cap_reset_day : ?Int;
        /// The daily usage breakdown for each Client Application a project
        daily_client_app_usage : ?[ClientAppUsage];
        daily_project_usage : ?UsageDailyProjectUsage;
        /// Total number of Posts that can be read in this project per month
        project_cap : ?Int;
        /// The unique identifier for this project
        project_id : ?Text;
        /// The number of Posts read in this project
        project_usage : ?Int;
    };

    public module JSON {
        // `init` constructs a Usage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Usage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : Usage {
            let ?res = from_candid(to_candid(required)) : ?Usage else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Usage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.cap_reset_day) {
                case (?v__) List.add(buf, ("cap_reset_day", #Int(v__)));
                case null ();
            };
            switch (value.daily_client_app_usage) {
                case (?v__) List.add(buf, ("daily_client_app_usage", #Array(Array.map<ClientAppUsage, Candid.Candid>(v__, ClientAppUsage.toCandidValue))));
                case null ();
            };
            switch (value.daily_project_usage) {
                case (?v__) List.add(buf, ("daily_project_usage", UsageDailyProjectUsage.toCandidValue(v__)));
                case null ();
            };
            switch (value.project_cap) {
                case (?v__) List.add(buf, ("project_cap", #Int(v__)));
                case null ();
            };
            switch (value.project_id) {
                case (?v__) List.add(buf, ("project_id", #Text(v__)));
                case null ();
            };
            switch (value.project_usage) {
                case (?v__) List.add(buf, ("project_usage", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Usage =
            switch (candid) {
                case (#Record(fields)) {
                    let cap_reset_day : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "cap_reset_day")) {
                        case (?cap_reset_day_field) ((switch (cap_reset_day_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let daily_client_app_usage : ?[ClientAppUsage] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "daily_client_app_usage")) {
                        case (?daily_client_app_usage_field) ((switch (daily_client_app_usage_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ClientAppUsage>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ClientAppUsage.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let daily_project_usage : ?UsageDailyProjectUsage = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "daily_project_usage")) {
                        case (?daily_project_usage_field) (UsageDailyProjectUsage.fromCandidValue(daily_project_usage_field.1));
                        case null null;
                    };
                    let project_cap : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "project_cap")) {
                        case (?project_cap_field) ((switch (project_cap_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let project_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "project_id")) {
                        case (?project_id_field) ((switch (project_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let project_usage : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "project_usage")) {
                        case (?project_usage_field) ((switch (project_usage_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        cap_reset_day;
                        daily_client_app_usage;
                        daily_project_usage;
                        project_cap;
                        project_id;
                        project_usage;
                    };
                };
                case _ null;
            };
    };
};
