import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatSendMessageRequest.mo

module {
    /// The required-fields slice of ChatSendMessageRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Base64-encoded Thrift MessageCreateEvent containing encrypted message contents.
        encoded_message_create_event : Text;
        /// Unique identifier for this message.
        message_id : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatSendMessageRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        conversation_token : ?Text;
        encoded_message_event_signature : ?Text;
    };

    public type ChatSendMessageRequest = Required and Optional;

    public module JSON {
        // `init` constructs a ChatSendMessageRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatSendMessageRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatSendMessageRequest {
            let ?res = from_candid(to_candid(required)) : ?ChatSendMessageRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatSendMessageRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.conversation_token) {
                case (?v__) List.add(buf, ("conversation_token", #Text(v__)));
                case null ();
            };
            List.add(buf, ("encoded_message_create_event", #Text(value.encoded_message_create_event)));
            switch (value.encoded_message_event_signature) {
                case (?v__) List.add(buf, ("encoded_message_event_signature", #Text(v__)));
                case null ();
            };
            List.add(buf, ("message_id", #Text(value.message_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatSendMessageRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let conversation_token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_token")) {
                        case (?conversation_token_field) ((switch (conversation_token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?encoded_message_create_event_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "encoded_message_create_event") else return null;
                    let ?encoded_message_create_event = ((switch (encoded_message_create_event_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let encoded_message_event_signature : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "encoded_message_event_signature")) {
                        case (?encoded_message_event_signature_field) ((switch (encoded_message_event_signature_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?message_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message_id") else return null;
                    let ?message_id = ((switch (message_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        conversation_token;
                        encoded_message_create_event;
                        encoded_message_event_signature;
                        message_id;
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
