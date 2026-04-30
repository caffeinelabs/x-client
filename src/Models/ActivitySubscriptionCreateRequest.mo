
import { type ActivitySubscriptionCreateRequestEventType; JSON = ActivitySubscriptionCreateRequestEventType } "./ActivitySubscriptionCreateRequestEventType";

import { type ActivitySubscriptionFilter; JSON = ActivitySubscriptionFilter } "./ActivitySubscriptionFilter";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ActivitySubscriptionCreateRequest.mo

module {
    public type ActivitySubscriptionCreateRequest = {
        event_type : ActivitySubscriptionCreateRequestEventType;
        filter : ActivitySubscriptionFilter;
        tag : ?Text;
        /// The unique identifier of this webhook config.
        webhook_id : ?Text;
    };

    public module JSON {
        // `init` constructs a ActivitySubscriptionCreateRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ActivitySubscriptionCreateRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            event_type : ActivitySubscriptionCreateRequestEventType;
            filter : ActivitySubscriptionFilter;
        }) : ActivitySubscriptionCreateRequest {
            let ?res = from_candid(to_candid(required)) : ?ActivitySubscriptionCreateRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ActivitySubscriptionCreateRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("event_type", ActivitySubscriptionCreateRequestEventType.toCandidValue(value.event_type)));
            List.add(buf, ("filter", ActivitySubscriptionFilter.toCandidValue(value.filter)));
            switch (value.tag) {
                case (?v__) List.add(buf, ("tag", #Text(v__)));
                case null ();
            };
            switch (value.webhook_id) {
                case (?v__) List.add(buf, ("webhook_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscriptionCreateRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?event_type_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_type") else return null;
                    let ?event_type = (ActivitySubscriptionCreateRequestEventType.fromCandidValue(event_type_field.1)) else return null;
                    let ?filter_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "filter") else return null;
                    let ?filter = (ActivitySubscriptionFilter.fromCandidValue(filter_field.1)) else return null;
                    let tag : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tag")) {
                        case (?tag_field) ((switch (tag_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let webhook_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "webhook_id")) {
                        case (?webhook_id_field) ((switch (webhook_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        event_type;
                        filter;
                        tag;
                        webhook_id;
                    };
                };
                case _ null;
            };
    };
};
