import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetMediaUploadStatusCommandParameter.mo
/// Enum values: #status

module {
    public type GetMediaUploadStatusCommandParameter = {
        #status;
    };

    public module JSON {
        public func toCandidValue(value : GetMediaUploadStatusCommandParameter) : Candid.Candid =
            switch (value) {
                case (#status) #Text("STATUS");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetMediaUploadStatusCommandParameter =
            switch (candid) {
                case (#Text("STATUS")) ?#status;
                case _ null;
            };

        public func toText(value : GetMediaUploadStatusCommandParameter) : Text =
            switch (value) {
                case (#status) "STATUS";
            };
    };
};
