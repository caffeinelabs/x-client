/// A participant's encrypted conversation key.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatConversationParticipantKey.mo

module {
    public type ChatConversationParticipantKey = {
        /// Conversation key encrypted with this participant's public key.
        encrypted_conversation_key : ?Text;
        /// Version of the participant's public key used for encryption.
        public_key_version : ?Text;
        /// Participant user ID.
        user_id : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatConversationParticipantKey) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.encrypted_conversation_key) {
                case (?v__) List.add(buf, ("encrypted_conversation_key", #Text(v__)));
                case null ();
            };
            switch (value.public_key_version) {
                case (?v__) List.add(buf, ("public_key_version", #Text(v__)));
                case null ();
            };
            switch (value.user_id) {
                case (?v__) List.add(buf, ("user_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatConversationParticipantKey =
            switch (candid) {
                case (#Record(fields)) {
                    let encrypted_conversation_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "encrypted_conversation_key")) {
                        case (?encrypted_conversation_key_field) ((switch (encrypted_conversation_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let public_key_version : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key_version")) {
                        case (?public_key_version_field) ((switch (public_key_version_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let user_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_id")) {
                        case (?user_id_field) ((switch (user_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        encrypted_conversation_key;
                        public_key_version;
                        user_id;
                    };
                };
                case _ null;
            };
    };
};
