/// A count of user-provided stream filtering rules at the client application level.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// AppRulesCount.mo

module {
    public type AppRulesCount = {
        /// The ID of the client application
        client_app_id : ?Text;
        /// Number of rules for client application
        rule_count : ?Int;
    };

    public module JSON {
        public func toCandidValue(value : AppRulesCount) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.client_app_id) {
                case (?v__) List.add(buf, ("client_app_id", #Text(v__)));
                case null ();
            };
            switch (value.rule_count) {
                case (?v__) List.add(buf, ("rule_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?AppRulesCount =
            switch (candid) {
                case (#Record(fields)) {
                    let client_app_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "client_app_id")) {
                        case (?client_app_id_field) ((switch (client_app_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let rule_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "rule_count")) {
                        case (?rule_count_field) ((switch (rule_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        client_app_id;
                        rule_count;
                    };
                };
                case _ null;
            };
    };
};
