/// Usage per client app

import { type UsageFields; JSON = UsageFields } "./UsageFields";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ClientAppUsage.mo

module {
    public type ClientAppUsage = {
        /// The unique identifier for this project
        client_app_id : ?Text;
        /// The usage value
        usage : ?[UsageFields];
        /// The number of results returned
        usage_result_count : ?Int;
    };

    public module JSON {
        public func toCandidValue(value : ClientAppUsage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.client_app_id) {
                case (?v__) List.add(buf, ("client_app_id", #Text(v__)));
                case null ();
            };
            switch (value.usage) {
                case (?v__) List.add(buf, ("usage", #Array(Array.map<UsageFields, Candid.Candid>(v__, UsageFields.toCandidValue))));
                case null ();
            };
            switch (value.usage_result_count) {
                case (?v__) List.add(buf, ("usage_result_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ClientAppUsage =
            switch (candid) {
                case (#Record(fields)) {
                    let client_app_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "client_app_id")) {
                        case (?client_app_id_field) ((switch (client_app_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let usage : ?[UsageFields] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "usage")) {
                        case (?usage_field) ((switch (usage_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<UsageFields>();
                            for (c__ in xs__.values()) {
                                let ?m__ = UsageFields.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let usage_result_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "usage_result_count")) {
                        case (?usage_result_count_field) ((switch (usage_result_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        client_app_id;
                        usage;
                        usage_result_count;
                    };
                };
                case _ null;
            };
    };
};
