
import { type Geo; JSON = Geo } "./Geo";

import { type PlaceType; JSON = PlaceType } "./PlaceType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Place.mo

module {
    public type Place = {
        contained_within : ?[Text];
        /// The full name of the county in which this place exists.
        country : ?Text;
        /// A two-letter ISO 3166-1 alpha-2 country code.
        country_code : ?Text;
        /// The full name of this place.
        full_name : Text;
        geo : ?Geo;
        /// The identifier for this place.
        id : Text;
        /// The human readable name of this place.
        name : ?Text;
        place_type : ?PlaceType;
    };

    public module JSON {
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
};
