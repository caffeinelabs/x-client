
import { type UnlikeComplianceSchemaFavorite; JSON = UnlikeComplianceSchemaFavorite } "./UnlikeComplianceSchemaFavorite";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UnlikeComplianceSchema.mo

module {
    public type UnlikeComplianceSchema = {
        /// Event time.
        event_at : Text;
        favorite : UnlikeComplianceSchemaFavorite;
    };

    public module JSON {
        public func toCandidValue(value : UnlikeComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("event_at", #Text(value.event_at)));
            List.add(buf, ("favorite", UnlikeComplianceSchemaFavorite.toCandidValue(value.favorite)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UnlikeComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?event_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_at") else return null;
                    let ?event_at = ((switch (event_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?favorite_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "favorite") else return null;
                    let ?favorite = (UnlikeComplianceSchemaFavorite.fromCandidValue(favorite_field.1)) else return null;
                    ?{
                        event_at;
                        favorite;
                    };
                };
                case _ null;
            };
    };
};
