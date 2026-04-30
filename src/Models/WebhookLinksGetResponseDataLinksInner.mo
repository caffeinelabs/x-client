import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// WebhookLinksGetResponseDataLinksInner.mo

module {
    public type WebhookLinksGetResponseDataLinksInner = {
        /// The application ID
        application_id : ?Text;
        /// The user ID
        business_user_id : ?Text;
        /// The datetime the webhook was linked to the stream
        created_at : ?Text;
        /// Requested fields to be rendered
        fields : ?[Text];
        /// The stream ID associated with the FilteredStream instance
        instance_id : ?Text;
        /// The unique identifier for the webhook
        webhook_id : ?Text;
    };

    public module JSON {
        // `init` constructs a WebhookLinksGetResponseDataLinksInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { WebhookLinksGetResponseDataLinksInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : WebhookLinksGetResponseDataLinksInner {
            let ?res = from_candid(to_candid(required)) : ?WebhookLinksGetResponseDataLinksInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : WebhookLinksGetResponseDataLinksInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.application_id) {
                case (?v__) List.add(buf, ("application_id", #Text(v__)));
                case null ();
            };
            switch (value.business_user_id) {
                case (?v__) List.add(buf, ("business_user_id", #Text(v__)));
                case null ();
            };
            switch (value.created_at) {
                case (?v__) List.add(buf, ("created_at", #Text(v__)));
                case null ();
            };
            switch (value.fields) {
                case (?v__) List.add(buf, ("fields", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.instance_id) {
                case (?v__) List.add(buf, ("instance_id", #Text(v__)));
                case null ();
            };
            switch (value.webhook_id) {
                case (?v__) List.add(buf, ("webhook_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?WebhookLinksGetResponseDataLinksInner =
            switch (candid) {
                case (#Record(fields)) {
                    let application_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "application_id")) {
                        case (?application_id_field) ((switch (application_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let business_user_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "business_user_id")) {
                        case (?business_user_id_field) ((switch (business_user_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let created_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at")) {
                        case (?created_at_field) ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let fields : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "fields")) {
                        case (?fields_field) ((switch (fields_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let instance_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "instance_id")) {
                        case (?instance_id_field) ((switch (instance_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let webhook_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "webhook_id")) {
                        case (?webhook_id_field) ((switch (webhook_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        application_id;
                        business_user_id;
                        created_at;
                        fields;
                        instance_id;
                        webhook_id;
                    };
                };
                case _ null;
            };
    };
};
