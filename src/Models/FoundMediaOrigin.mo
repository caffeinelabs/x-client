import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// FoundMediaOrigin.mo

module {
    public type FoundMediaOrigin = {
        /// Unique Identifier of media within provider ( <= 24 characters ))
        id : Text;
        /// The media provider (e.g., 'giphy') that sourced the media ( <= 8 Characters )
        provider : Text;
    };

    public module JSON {
        public func toCandidValue(value : FoundMediaOrigin) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("provider", #Text(value.provider)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?FoundMediaOrigin =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?provider_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "provider") else return null;
                    let ?provider = ((switch (provider_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        id;
                        provider;
                    };
                };
                case _ null;
            };
    };
};
