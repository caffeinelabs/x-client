
import { type ChatActionSignature; JSON = ChatActionSignature } "./ChatActionSignature";

import { type ChatConversationParticipantKey; JSON = ChatConversationParticipantKey } "./ChatConversationParticipantKey";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCreateConversationRequest.mo

module {
    /// The required-fields slice of ChatCreateConversationRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Client-generated conversation ID.
        conversation_id : Text;
        /// Version of the conversation encryption key.
        conversation_key_version : Text;
        /// Encrypted conversation keys for each participant.
        conversation_participant_keys : [ChatConversationParticipantKey];
        /// User IDs of group members to include in the conversation.
        group_members : [Text];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatCreateConversationRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        action_signatures : ?[ChatActionSignature];
        base64_encoded_key_rotation : ?Text;
        group_admins : ?[Text];
        group_avatar_url : ?Text;
        group_description : ?Text;
        group_name : ?Text;
        ttl_msec : ?Text;
    };

    public type ChatCreateConversationRequest = Required and Optional;

    public module JSON {
        // `init` constructs a ChatCreateConversationRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCreateConversationRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatCreateConversationRequest {
            let ?res = from_candid(to_candid(required)) : ?ChatCreateConversationRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCreateConversationRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.action_signatures) {
                case (?v__) List.add(buf, ("action_signatures", #Array(Array.map<ChatActionSignature, Candid.Candid>(v__, ChatActionSignature.toCandidValue))));
                case null ();
            };
            switch (value.base64_encoded_key_rotation) {
                case (?v__) List.add(buf, ("base64_encoded_key_rotation", #Text(v__)));
                case null ();
            };
            List.add(buf, ("conversation_id", #Text(value.conversation_id)));
            List.add(buf, ("conversation_key_version", #Text(value.conversation_key_version)));
            List.add(buf, ("conversation_participant_keys", #Array(Array.map<ChatConversationParticipantKey, Candid.Candid>(value.conversation_participant_keys, ChatConversationParticipantKey.toCandidValue))));
            switch (value.group_admins) {
                case (?v__) List.add(buf, ("group_admins", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.group_avatar_url) {
                case (?v__) List.add(buf, ("group_avatar_url", #Text(v__)));
                case null ();
            };
            switch (value.group_description) {
                case (?v__) List.add(buf, ("group_description", #Text(v__)));
                case null ();
            };
            List.add(buf, ("group_members", #Array(Array.map<Text, Candid.Candid>(value.group_members, func(s : Text) : Candid.Candid = #Text(s)))));
            switch (value.group_name) {
                case (?v__) List.add(buf, ("group_name", #Text(v__)));
                case null ();
            };
            switch (value.ttl_msec) {
                case (?v__) List.add(buf, ("ttl_msec", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCreateConversationRequest =
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
                    let ?conversation_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_id") else return null;
                    let ?conversation_id = ((switch (conversation_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
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
                    let group_admins : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "group_admins")) {
                        case (?group_admins_field) ((switch (group_admins_field.1) {
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
                    let group_avatar_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "group_avatar_url")) {
                        case (?group_avatar_url_field) ((switch (group_avatar_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let group_description : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "group_description")) {
                        case (?group_description_field) ((switch (group_description_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?group_members_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "group_members") else return null;
                    let ?group_members = ((switch (group_members_field.1) {
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
                    let group_name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "group_name")) {
                        case (?group_name_field) ((switch (group_name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ttl_msec : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "ttl_msec")) {
                        case (?ttl_msec_field) ((switch (ttl_msec_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        action_signatures;
                        base64_encoded_key_rotation;
                        conversation_id;
                        conversation_key_version;
                        conversation_participant_keys;
                        group_admins;
                        group_avatar_url;
                        group_description;
                        group_members;
                        group_name;
                        ttl_msec;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
