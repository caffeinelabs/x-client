
import { type Geo; JSON = Geo } "./Geo";

import { type PlaceType; JSON = PlaceType } "./PlaceType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Place.mo

module {
    /// The required-fields slice of Place — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The full name of this place.
        full_name : Text;
        /// The identifier for this place.
        id : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Place as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        contained_within : ?[Text];
        country : ?Text;
        country_code : ?Text;
        geo : ?Geo;
        name : ?Text;
        place_type : ?PlaceType;
    };

    public type Place = Required and Optional;

    public module JSON {
        // `init` constructs a Place from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Place.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Place {
            let ?res = from_candid(to_candid(required)) : ?Place else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Place) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.contained_within) {
                case (?v__) List.add(buf, ("contained_within", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.country) {
                case (?v__) List.add(buf, ("country", #Text(v__)));
                case null ();
            };
            switch (value.country_code) {
                case (?v__) List.add(buf, ("country_code", #Text(v__)));
                case null ();
            };
            List.add(buf, ("full_name", #Text(value.full_name)));
            switch (value.geo) {
                case (?v__) List.add(buf, ("geo", Geo.toCandidValue(v__)));
                case null ();
            };
            List.add(buf, ("id", #Text(value.id)));
            switch (value.name) {
                case (?v__) List.add(buf, ("name", #Text(v__)));
                case null ();
            };
            switch (value.place_type) {
                case (?v__) List.add(buf, ("place_type", PlaceType.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Place =
            switch (candid) {
                case (#Record(fields)) {
                    let contained_within : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "contained_within")) {
                        case (?contained_within_field) ((switch (contained_within_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let country : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "country")) {
                        case (?country_field) ((switch (country_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let country_code : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "country_code")) {
                        case (?country_code_field) ((switch (country_code_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?full_name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "full_name") else return null;
                    let ?full_name = ((switch (full_name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let geo : ?Geo = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "geo")) {
                        case (?geo_field) (Geo.fromCandidValue(geo_field.1));
                        case null null;
                    };
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name")) {
                        case (?name_field) ((switch (name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let place_type : ?PlaceType = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "place_type")) {
                        case (?place_type_field) (PlaceType.fromCandidValue(place_type_field.1));
                        case null null;
                    };
                    ?{
                        contained_within;
                        country;
                        country_code;
                        full_name;
                        geo;
                        id;
                        name;
                        place_type;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
