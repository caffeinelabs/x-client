import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PublicKeyTokenMapRealmsInner.mo

module {
    public type PublicKeyTokenMapRealmsInner = {
        /// Realm URL.
        address : ?Text;
        /// Realm identifier.
        realm_id : ?Text;
        /// JWT auth token for realm.
        token : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : PublicKeyTokenMapRealmsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.address) {
                case (?v__) List.add(buf, ("address", #Text(v__)));
                case null ();
            };
            switch (value.realm_id) {
                case (?v__) List.add(buf, ("realm_id", #Text(v__)));
                case null ();
            };
            switch (value.token) {
                case (?v__) List.add(buf, ("token", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PublicKeyTokenMapRealmsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let address : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "address")) {
                        case (?address_field) ((switch (address_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let realm_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "realm_id")) {
                        case (?realm_id_field) ((switch (realm_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token")) {
                        case (?token_field) ((switch (token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        address;
                        realm_id;
                        token;
                    };
                };
                case _ null;
            };
    };
};
