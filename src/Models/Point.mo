/// A [GeoJson Point](https://tools.ietf.org/html/rfc7946#section-3.1.2) geometry object.

import { type PointType; JSON = PointType } "./PointType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Point.mo

module {
    public type Point = {
        /// A [GeoJson Position](https://tools.ietf.org/html/rfc7946#section-3.1.1) in the format `[longitude,latitude]`.
        coordinates : [Float];
        type_ : PointType;
    };

    public module JSON {
        public func toCandidValue(value : Point) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("coordinates", #Array(Array.map<Float, Candid.Candid>(value.coordinates, func(f : Float) : Candid.Candid = #Float(f)))));
            List.add(buf, ("type", PointType.toCandidValue(value.type_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Point =
            switch (candid) {
                case (#Record(fields)) {
                    let ?coordinates_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "coordinates") else return null;
                    let ?coordinates = ((switch (coordinates_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Float>();
                            for (c__ in xs__.values()) {
                                let ?f__ = (switch (c__) { case (#Float(g)) ?g; case (#Int(j)) ?Float.fromInt(j); case (#Nat(k)) ?Float.fromInt(k); case _ null }) else return null;
                                List.add(buf__, f__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (PointType.fromCandidValue(type__field.1)) else return null;
                    ?{
                        coordinates;
                        type_;
                    };
                };
                case _ null;
            };
    };
};
