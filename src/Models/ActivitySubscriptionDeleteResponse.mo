
import { type ActivitySubscriptionDeleteResponseData; JSON = ActivitySubscriptionDeleteResponseData } "./ActivitySubscriptionDeleteResponseData";

import { type ActivitySubscriptionDeleteResponseMeta; JSON = ActivitySubscriptionDeleteResponseMeta } "./ActivitySubscriptionDeleteResponseMeta";

import { type Problem; JSON = Problem } "./Problem";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ActivitySubscriptionDeleteResponse.mo

module {
    public type ActivitySubscriptionDeleteResponse = {
        data : ?ActivitySubscriptionDeleteResponseData;
        errors : ?[Problem];
        meta : ?ActivitySubscriptionDeleteResponseMeta;
    };

    public module JSON {
        // `init` constructs a ActivitySubscriptionDeleteResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ActivitySubscriptionDeleteResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ActivitySubscriptionDeleteResponse {
            let ?res = from_candid(to_candid(required)) : ?ActivitySubscriptionDeleteResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ActivitySubscriptionDeleteResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", ActivitySubscriptionDeleteResponseData.toCandidValue(v__)));
                case null ();
            };
            switch (value.errors) {
                case (?v__) List.add(buf, ("errors", #Array(Array.map<Problem, Candid.Candid>(v__, Problem.toCandidValue))));
                case null ();
            };
            switch (value.meta) {
                case (?v__) List.add(buf, ("meta", ActivitySubscriptionDeleteResponseMeta.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscriptionDeleteResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?ActivitySubscriptionDeleteResponseData = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) (ActivitySubscriptionDeleteResponseData.fromCandidValue(data_field.1));
                        case null null;
                    };
                    let errors : ?[Problem] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "errors")) {
                        case (?errors_field) ((switch (errors_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Problem>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Problem.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let meta : ?ActivitySubscriptionDeleteResponseMeta = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "meta")) {
                        case (?meta_field) (ActivitySubscriptionDeleteResponseMeta.fromCandidValue(meta_field.1));
                        case null null;
                    };
                    ?{
                        data;
                        errors;
                        meta;
                    };
                };
                case _ null;
            };
    };
};
