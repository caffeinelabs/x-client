
import { type ChatActionSignature; JSON = ChatActionSignature } "./ChatActionSignature";

import { type ChatConversationParticipantKey; JSON = ChatConversationParticipantKey } "./ChatConversationParticipantKey";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatInitializeConversationKeysRequest.mo

module {
    /// The required-fields slice of ChatInitializeConversationKeysRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Version of the conversation encryption key (typically a timestamp in milliseconds).
        conversation_key_version : Text;
        /// The conversation key encrypted for each participant using their public key.
        conversation_participant_keys : [ChatConversationParticipantKey];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatInitializeConversationKeysRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        action_signatures : ?[ChatActionSignature];
        base64_encoded_key_rotation : ?Text;
    };

    public type ChatInitializeConversationKeysRequest = Required and Optional;

    public module JSON {
        // `init` constructs a ChatInitializeConversationKeysRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatInitializeConversationKeysRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatInitializeConversationKeysRequest {
            let ?res = from_candid(to_candid(required)) : ?ChatInitializeConversationKeysRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatInitializeConversationKeysRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.action_signatures) {
                case (?v__) List.add(buf, ("action_signatures", #Array(Array.map<ChatActionSignature, Candid.Candid>(v__, ChatActionSignature.toCandidValue))));
                case null ();
            };
            switch (value.base64_encoded_key_rotation) {
                case (?v__) List.add(buf, ("base64_encoded_key_rotation", #Text(v__)));
                case null ();
            };
            List.add(buf, ("conversation_key_version", #Text(value.conversation_key_version)));
            List.add(buf, ("conversation_participant_keys", #Array(Array.map<ChatConversationParticipantKey, Candid.Candid>(value.conversation_participant_keys, ChatConversationParticipantKey.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatInitializeConversationKeysRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let action_signatures : ?[ChatActionSignature] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "action_signatures")) {
                        case (?action_signatures_field) ((switch (action_signatures_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatActionSignature>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatActionSignature.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let base64_encoded_key_rotation : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "base64_encoded_key_rotation")) {
                        case (?base64_encoded_key_rotation_field) ((switch (base64_encoded_key_rotation_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?conversation_key_version_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_key_version") else return null;
                    let ?conversation_key_version = ((switch (conversation_key_version_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?conversation_participant_keys_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_participant_keys") else return null;
                    let ?conversation_participant_keys = ((switch (conversation_participant_keys_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatConversationParticipantKey>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatConversationParticipantKey.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        action_signatures;
                        base64_encoded_key_rotation;
                        conversation_key_version;
                        conversation_participant_keys;
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
