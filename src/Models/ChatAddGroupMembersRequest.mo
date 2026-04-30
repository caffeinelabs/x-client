
import { type ChatActionSignature; JSON = ChatActionSignature } "./ChatActionSignature";

import { type ChatConversationParticipantKey; JSON = ChatConversationParticipantKey } "./ChatConversationParticipantKey";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatAddGroupMembersRequest.mo

module {
    /// The required-fields slice of ChatAddGroupMembersRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// List of user IDs to add to the group conversation.
        user_ids : [Text];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatAddGroupMembersRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        action_signatures : ?[ChatActionSignature];
        conversation_key_version : ?Text;
        conversation_participant_keys : ?[ChatConversationParticipantKey];
        encrypted_avatar_url : ?Text;
        encrypted_title : ?Text;
    };

    public type ChatAddGroupMembersRequest = Required and Optional;

    public module JSON {
        // `init` constructs a ChatAddGroupMembersRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatAddGroupMembersRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatAddGroupMembersRequest {
            let ?res = from_candid(to_candid(required)) : ?ChatAddGroupMembersRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatAddGroupMembersRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.action_signatures) {
                case (?v__) List.add(buf, ("action_signatures", #Array(Array.map<ChatActionSignature, Candid.Candid>(v__, ChatActionSignature.toCandidValue))));
                case null ();
            };
            switch (value.conversation_key_version) {
                case (?v__) List.add(buf, ("conversation_key_version", #Text(v__)));
                case null ();
            };
            switch (value.conversation_participant_keys) {
                case (?v__) List.add(buf, ("conversation_participant_keys", #Array(Array.map<ChatConversationParticipantKey, Candid.Candid>(v__, ChatConversationParticipantKey.toCandidValue))));
                case null ();
            };
            switch (value.encrypted_avatar_url) {
                case (?v__) List.add(buf, ("encrypted_avatar_url", #Text(v__)));
                case null ();
            };
            switch (value.encrypted_title) {
                case (?v__) List.add(buf, ("encrypted_title", #Text(v__)));
                case null ();
            };
            List.add(buf, ("user_ids", #Array(Array.map<Text, Candid.Candid>(value.user_ids, func(s : Text) : Candid.Candid = #Text(s)))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatAddGroupMembersRequest =
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
                    let conversation_key_version : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_key_version")) {
                        case (?conversation_key_version_field) ((switch (conversation_key_version_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let conversation_participant_keys : ?[ChatConversationParticipantKey] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_participant_keys")) {
                        case (?conversation_participant_keys_field) ((switch (conversation_participant_keys_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatConversationParticipantKey>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatConversationParticipantKey.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let encrypted_avatar_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "encrypted_avatar_url")) {
                        case (?encrypted_avatar_url_field) ((switch (encrypted_avatar_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let encrypted_title : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "encrypted_title")) {
                        case (?encrypted_title_field) ((switch (encrypted_title_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?user_ids_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_ids") else return null;
                    let ?user_ids = ((switch (user_ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        action_signatures;
                        conversation_key_version;
                        conversation_participant_keys;
                        encrypted_avatar_url;
                        encrypted_title;
                        user_ids;
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
