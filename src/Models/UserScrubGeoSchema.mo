
import { type UserScrubGeoObjectSchema; JSON = UserScrubGeoObjectSchema } "./UserScrubGeoObjectSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserScrubGeoSchema.mo

module {
    public type UserScrubGeoSchema = {
        scrub_geo : UserScrubGeoObjectSchema;
    };

    public module JSON {
        // `init` constructs a UserScrubGeoSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserScrubGeoSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            scrub_geo : UserScrubGeoObjectSchema;
        }) : UserScrubGeoSchema {
            let ?res = from_candid(to_candid(required)) : ?UserScrubGeoSchema else Runtime.unreachable();
            res
        };

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
