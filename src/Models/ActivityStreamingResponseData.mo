
import { type ActivityStreamingResponsePayload; JSON = ActivityStreamingResponsePayload } "./ActivityStreamingResponsePayload";

import { type ActivitySubscriptionFilter; JSON = ActivitySubscriptionFilter } "./ActivitySubscriptionFilter";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ActivityStreamingResponseData.mo

module {
    /// The required-fields slice of ActivityStreamingResponseData — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ActivityStreamingResponseData as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        event_type : ?Text;
        event_uuid : ?Text;
        filter : ?ActivitySubscriptionFilter;
        payload : ?ActivityStreamingResponsePayload;
        tag : ?Text;
    };

    public type ActivityStreamingResponseData = Required and Optional;

    public module JSON {
        // `init` constructs a ActivityStreamingResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ActivityStreamingResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ActivityStreamingResponseData {
            let ?res = from_candid(to_candid(required)) : ?ActivityStreamingResponseData else Runtime.unreachable();
            res
        };

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

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
