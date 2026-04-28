
import { type ChatJuiceboxConfigTokenMapInnerValue; JSON = ChatJuiceboxConfigTokenMapInnerValue } "./ChatJuiceboxConfigTokenMapInnerValue";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatJuiceboxConfigTokenMapInner.mo

module {
    public type ChatJuiceboxConfigTokenMapInner = {
        /// Realm identifier.
        key : ?Text;
        value : ?ChatJuiceboxConfigTokenMapInnerValue;
    };

    public module JSON {
        public func toCandidValue(value : ChatJuiceboxConfigTokenMapInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.key) {
                case (?v__) List.add(buf, ("key", #Text(v__)));
                case null ();
            };
            switch (value.value) {
                case (?v__) List.add(buf, ("value", ChatJuiceboxConfigTokenMapInnerValue.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatJuiceboxConfigTokenMapInner =
            switch (candid) {
                case (#Record(fields)) {
                    let key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "key")) {
                        case (?key_field) ((switch (key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let value : ?ChatJuiceboxConfigTokenMapInnerValue = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "value")) {
                        case (?value_field) (ChatJuiceboxConfigTokenMapInnerValue.fromCandidValue(value_field.1));
                        case null null;
                    };
                    ?{
                        key;
                        value;
                    };
                };
                case _ null;
            };
    };
};
