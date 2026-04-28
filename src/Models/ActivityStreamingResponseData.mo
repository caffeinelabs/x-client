
import { type ActivityStreamingResponsePayload; JSON = ActivityStreamingResponsePayload } "./ActivityStreamingResponsePayload";

import { type ActivitySubscriptionFilter; JSON = ActivitySubscriptionFilter } "./ActivitySubscriptionFilter";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ActivityStreamingResponseData.mo

module {
    public type ActivityStreamingResponseData = {
        event_type : ?Text;
        /// The unique identifier of an Activity event.
        event_uuid : ?Text;
        filter : ?ActivitySubscriptionFilter;
        payload : ?ActivityStreamingResponsePayload;
        tag : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ActivityStreamingResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.event_type) {
                case (?v__) List.add(buf, ("event_type", #Text(v__)));
                case null ();
            };
            switch (value.event_uuid) {
                case (?v__) List.add(buf, ("event_uuid", #Text(v__)));
                case null ();
            };
            switch (value.filter) {
                case (?v__) List.add(buf, ("filter", ActivitySubscriptionFilter.toCandidValue(v__)));
                case null ();
            };
            switch (value.payload) {
                case (?v__) List.add(buf, ("payload", ActivityStreamingResponsePayload.toCandidValue(v__)));
                case null ();
            };
            switch (value.tag) {
                case (?v__) List.add(buf, ("tag", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivityStreamingResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let event_type : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_type")) {
                        case (?event_type_field) ((switch (event_type_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let event_uuid : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_uuid")) {
                        case (?event_uuid_field) ((switch (event_uuid_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let filter : ?ActivitySubscriptionFilter = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "filter")) {
                        case (?filter_field) (ActivitySubscriptionFilter.fromCandidValue(filter_field.1));
                        case null null;
                    };
                    let payload : ?ActivityStreamingResponsePayload = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "payload")) {
                        case (?payload_field) (ActivityStreamingResponsePayload.fromCandidValue(payload_field.1));
                        case null null;
                    };
                    let tag : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tag")) {
                        case (?tag_field) ((switch (tag_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        event_type;
                        event_uuid;
                        filter;
                        payload;
                        tag;
                    };
                };
                case _ null;
            };
    };
};
