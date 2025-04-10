

## create test data frame with relication in 2 environments
testdf <- data.frame(genotype=rep(rownames(mppheno),2),
                     site = rep(c('S1','S2'),each=nrow(mppheno)),
                     phenotype1=c(mppheno,mppheno * 1.1))
## add  row names for tabulation
rownames(testdf) <- paste(testdf$genotype,testdf$site,sep='_')
## create pheotype matrix
pheno_matrix <- matrix(testdf[,3])
rownames(pheno_matrix) <- rownames(testdf)
## cofactor matrix for site factor
cof_matrix <- matrix(rep(c('S1','S2'),each=nrow(mppheno)))
rownames(cof_matrix) <- rownames(testdf)

## z matrix with dimensions aligned to y matrix and  dosage mmatrix
z_matrix <- as.matrix(table(rownames(testdf),testdf$genotype))[rownames(testdf),colnames(mpsnpdose)]

test_that(desc='z matrix colnames match snp matrix',
          code = {expect_identical(colnames(mpsnpdose),colnames(z_matrix))})

test_that(desc='z matrix rownames match phenotype matrix',
          code = {expect_identical(rownames(pheno_matrix),rownames(z_matrix))})

test_that(desc='cofactor matrix rownames match phenotype matrix',
          code = {expect_identical(rownames(cof_matrix),rownames(pheno_matrix))})


test_that(desc = 'linear model with z matrix works',
          code = {expect_no_error(
            map.QTL(
            phenotypes = pheno_matrix,
            genotypes = mpsnpdose,
            Z = z_matrix,
            cofactor = cof_matrix,
            cofactor.type = 'cat',
            ploidy = 4,
            map = mpmap)
            )
          }
)

