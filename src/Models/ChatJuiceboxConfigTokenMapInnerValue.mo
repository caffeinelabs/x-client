/// Realm connection details.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatJuiceboxConfigTokenMapInnerValue.mo

module {
    public type ChatJuiceboxConfigTokenMapInnerValue = {
        /// Realm URL.
        address : ?Text;
        /// Realm public key.
        public_key : ?Text;
        /// JWT auth token for the realm.
        token : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatJuiceboxConfigTokenMapInnerValue) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.address) {
                case (?v__) List.add(buf, ("address", #Text(v__)));
                case null ();
            };
            switch (value.public_key) {
                case (?v__) List.add(buf, ("public_key", #Text(v__)));
                case null ();
            };
            switch (value.token) {
                case (?v__) List.add(buf, ("token", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatJuiceboxConfigTokenMapInnerValue =
            switch (candid) {
                case (#Record(fields)) {
                    let address : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "address")) {
                        case (?address_field) ((switch (address_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key")) {
                        case (?public_key_field) ((switch (public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token")) {
                        case (?token_field) ((switch (token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        address;
                        public_key;
                        token;
                    };
                };
                case _ null;
            };
    };
};
