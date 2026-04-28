import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ManagementInfo.mo

module {
    public type ManagementInfo = {
        /// Indicates if the media is managed by Media Studio
        managed : Bool;
    };

    public module JSON {
        public func toCandidValue(value : ManagementInfo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("managed", #Bool(value.managed)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ManagementInfo =
            switch (candid) {
                case (#Record(fields)) {
                    let ?managed_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "managed") else return null;
                    let ?managed = ((switch (managed_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        managed;
                    };
                };
                case _ null;
            };
    };
};
