
import { type ChatAddPublicKeyRequestPublicKey; JSON = ChatAddPublicKeyRequestPublicKey } "./ChatAddPublicKeyRequestPublicKey";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatAddPublicKeyRequest.mo

module {
    public type ChatAddPublicKeyRequest = {
        /// When true, the server generates a new version.
        generate_version : ?Bool;
        public_key : ChatAddPublicKeyRequestPublicKey;
        /// Public key version.
        version : Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatAddPublicKeyRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.generate_version) {
                case (?v__) List.add(buf, ("generate_version", #Bool(v__)));
                case null ();
            };
            List.add(buf, ("public_key", ChatAddPublicKeyRequestPublicKey.toCandidValue(value.public_key)));
            List.add(buf, ("version", #Text(value.version)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatAddPublicKeyRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let generate_version : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "generate_version")) {
                        case (?generate_version_field) ((switch (generate_version_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let ?public_key_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key") else return null;
                    let ?public_key = (ChatAddPublicKeyRequestPublicKey.fromCandidValue(public_key_field.1)) else return null;
                    let ?version_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "version") else return null;
                    let ?version = ((switch (version_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        generate_version;
                        public_key;
                        version;
                    };
                };
                case _ null;
            };
    };
};
