/// Signing key information for message verification.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatMessageSigningKeyInfo.mo

module {
    public type ChatMessageSigningKeyInfo = {
        /// The member ID associated with this signing key.
        member_id : ?Text;
        /// The version of the public key.
        public_key_version : ?Text;
        /// The signing public key.
        signing_public_key : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatMessageSigningKeyInfo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.member_id) {
                case (?v__) List.add(buf, ("member_id", #Text(v__)));
                case null ();
            };
            switch (value.public_key_version) {
                case (?v__) List.add(buf, ("public_key_version", #Text(v__)));
                case null ();
            };
            switch (value.signing_public_key) {
                case (?v__) List.add(buf, ("signing_public_key", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMessageSigningKeyInfo =
            switch (candid) {
                case (#Record(fields)) {
                    let member_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "member_id")) {
                        case (?member_id_field) ((switch (member_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let public_key_version : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key_version")) {
                        case (?public_key_version_field) ((switch (public_key_version_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signing_public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signing_public_key")) {
                        case (?signing_public_key_field) ((switch (signing_public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        member_id;
                        public_key_version;
                        signing_public_key;
                    };
                };
                case _ null;
            };
    };
};
