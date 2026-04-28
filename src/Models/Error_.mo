import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Error_.mo

module {
    public type Error_ = {
        code : Int;
        message : Text;
    };

    public module JSON {
        public func toCandidValue(value : Error_) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("code", #Int(value.code)));
            List.add(buf, ("message", #Text(value.message)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Error_ =
            switch (candid) {
                case (#Record(fields)) {
                    let ?code_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "code") else return null;
                    let ?code = ((switch (code_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?message_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message") else return null;
                    let ?message = ((switch (message_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        code;
                        message;
                    };
                };
                case _ null;
            };
    };
};
