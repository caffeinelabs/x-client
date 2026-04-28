
import { type UserScrubGeoObjectSchema; JSON = UserScrubGeoObjectSchema } "./UserScrubGeoObjectSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserScrubGeoSchema.mo

module {
    public type UserScrubGeoSchema = {
        scrub_geo : UserScrubGeoObjectSchema;
    };

    public module JSON {
        public func toCandidValue(value : UserScrubGeoSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("scrub_geo", UserScrubGeoObjectSchema.toCandidValue(value.scrub_geo)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserScrubGeoSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?scrub_geo_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "scrub_geo") else return null;
                    let ?scrub_geo = (UserScrubGeoObjectSchema.fromCandidValue(scrub_geo_field.1)) else return null;
                    ?{
                        scrub_geo;
                    };
                };
                case _ null;
            };
    };
};
