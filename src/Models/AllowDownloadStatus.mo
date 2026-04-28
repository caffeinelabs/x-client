import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// AllowDownloadStatus.mo

module {
    public type AllowDownloadStatus = {
        allow_download : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : AllowDownloadStatus) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.allow_download) {
                case (?v__) List.add(buf, ("allow_download", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?AllowDownloadStatus =
            switch (candid) {
                case (#Record(fields)) {
                    let allow_download : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "allow_download")) {
                        case (?allow_download_field) ((switch (allow_download_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        allow_download;
                    };
                };
                case _ null;
            };
    };
};
