RNAseq data is widely used to study transcriptomic wide changes in varying biological conditions. In case of clear cut conditions such as treatment/control, Knockout/wildtype, diseased/healthy etc dimensionality reduction methods such as PCA can give us a clear picture of how the biological samples seperate. However, in case where such clean distinction does not exist such as in "all-patients", "all-treatment" samples etc, sub-type identification can be challenging.

Here, we use a consensus clustering method to seperate out samples where distinction is rather weak or not easily discernable.

We center the RNAseq matrix and after which we consensus cluster to find various subclasses of patients/samples.
