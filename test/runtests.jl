using UCIData
using Test


ENV["DATADEPS_ALWAYS_ACCEPT"] = true

expected_sizes = Dict(
    "classification" => Dict(
        "acute-inflammations-1" => (120, 8, 5, 0),
        "acute-inflammations-2" => (120, 8, 5, 0),
        "arrhythmia" => (452, 281, 0, 408),
        "balance-scale" => (625, 6, 0, 0),
        "balloons-a" => (20, 6, 4, 0),
        "balloons-b" => (20, 6, 4, 0),
        "balloons-c" => (20, 6, 4, 0),
        "balloons-d" => (16, 6, 4, 0),
        "banknote-authentication" => (1372, 6, 0, 0),
        "blood-transfusion-service-center" => (748, 6, 0, 0),
        "breast-cancer" => (286, 11, 8, 9),
        "breast-cancer-wisconsin-diagnostic" => (569, 32, 0, 0),
        "breast-cancer-wisconsin-prognostic" => (198, 34, 0, 4),
        "breast-cancer-wisconsin-original" => (699, 11, 0, 16),
        "car-evaluation" => (1728, 8, 6, 0),
        "chess-king-rook-vs-king-pawn" => (3196, 38, 36, 0),
        "chess-king-rook-vs-king" => (28056, 8, 6, 0),
        "climate-model-simulation-crashes" => (540, 20, 0, 0),
        "cnae-9" => (1080, 858, 0, 0),
        "congressional-voting-records" => (435, 18, 16, 392),
        "connectionist-bench-sonar" => (208, 62, 0, 0),
        "connectionist-bench" => (990, 12, 0, 0),
        "contraceptive-method-choice" => (1473, 11, 1, 0),
        "credit-approval" => (690, 17, 9, 67),
        "cylinder-bands" => (540, 41, 19, 999),
        "dermatology" => (366, 36, 0, 8),
        "echocardiogram" => (132, 9, 0, 103),
        "ecoli" => (336, 9, 0, 0),
        "fertility" => (100, 11, 2, 0),
        "flags" => (194, 30, 6, 0),
        "glass-identification" => (214, 11, 0, 0),
        "haberman-survival" => (306, 5, 0, 0),
        "hayes-roth" => (132, 6, 0, 0),
        "heart-disease-cleveland" => (303, 15, 4, 6),
        "heart-disease-hungarian" => (294, 15, 4, 782),
        "heart-disease-switzerland" => (123, 15, 4, 273),
        "heart-disease-va" => (200, 15, 4, 698),
        "hepatitis" => (155, 21, 0, 167),
        "hill-valley-noise" => (606, 102, 0, 0),
        "hill-valley" => (606, 102, 0, 0),
        "horse-colic" => (300, 24, 9, 1604),
        "image-segmentation" => (210, 21, 0, 0),
        "indian-liver-patient" => (583, 12, 1, 4),
        "ionosphere" => (351, 36, 0, 0),
        "iris" => (150, 6, 0, 0),
        "lenses" => (24, 6, 4, 0),
        "letter-recognition" => (20000, 18, 0, 0),
        "libras-movement" => (360, 92, 0, 0),
        "lung-cancer" => (32, 58, 56, 5),
        "magic-gamma-telescope" => (19020, 12, 0, 0),
        "mammographic-mass" => (961, 7, 2, 162),
        "monks-problems-1" => (124, 8, 6, 0),
        "monks-problems-2" => (169, 8, 6, 0),
        "monks-problems-3" => (122, 8, 6, 0),
        "mushroom" => (8124, 24, 22, 2480),
        "nursery" => (12960, 10, 8, 0),
        "optical-recognition-handwritten-digits" => (3823, 66, 0, 0),
        "ozone-level-detection-eight" => (2534, 74, 0, 14937),
        "ozone-level-detection-one" => (2536, 74, 0, 14938),
        "parkinsons" => (195, 23, 0, 0),
        "pen-based-recognition-handwritten-digits" => (7494, 18, 0, 0),
        "planning-relax" => (182, 14, 0, 0),
        "poker-hand" => (25010, 12, 0, 0),
        "post-operative-patient" => (90, 10, 7, 3),
        "qsar-biodegradation" => (1055, 43, 0, 0),
        "seeds" => (210, 9, 0, 0),
        "seismic-bumps" => (2584, 20, 4, 0),
        "shuttle-landing-control" => (15, 8, 6, 26),
        "skin-segmentation" => (245057, 5, 0, 0),
        "soybean-large" => (307, 37, 35, 712),
        "soybean-small" => (47, 37, 35, 0),
        "spambase" => (4601, 59, 0, 0),
        "spect-heart" => (80, 24, 22, 0),
        "spectf-heart" => (80, 46, 0, 0),
        "statlog-project-german-credit" => (1000, 22, 13, 0),
        "statlog-project-landsat-satellite" => (4435, 38, 0, 0),
        "teaching-assistant-evaluation" => (151, 7, 4, 0),
        "thoracic-surgery" => (470, 18, 13, 0),
        "thyroid-disease-allbp" => (2800, 31, 22, 4556),
        "thyroid-disease-allhyper" => (2800, 31, 22, 4556),
        "thyroid-disease-allhypo" => (2800, 31, 22, 4556),
        "thyroid-disease-allrep" => (2800, 31, 22, 4556),
        "thyroid-disease-ann-thyroid" => (3772, 23, 0, 0),
        "thyroid-disease-dis" => (2800, 31, 22, 4556),
        "thyroid-disease-new-thyroid" => (215, 7, 0, 0),
        "thyroid-disease-sick-euthyroid" => (3163, 27, 18, 5329),
        "thyroid-disease-sick" => (2800, 31, 22, 4556),
        "thyroid-disease-thyroid-0387" => (9172, 31, 22, 14629),
        "tic-tac-toe-endgame" => (958, 11, 9, 0),
        "trains" => (10, 34, 22, 51),
        "wall-following-robot-navigation-2" => (5456, 4, 0, 0),
        "wall-following-robot-navigation-24" => (5456, 26, 0, 0),
        "wall-following-robot-navigation-4" => (5456, 6, 0, 0),
        "wine" => (178, 15, 0, 0),
        "yeast" => (1484, 10, 0, 0),
        "zoo" => (101, 18, 15, 0),
    ),
    "regression" => Dict(
        "abalone" => (4177, 10, 1, 0),
        "ailerons" => (7154, 42, 0, 0),
        "airfoil-self-noise" => (1503, 7, 0, 0),
        "airline-costs" => (31, 11, 0, 0),
        "auto-mpg" => (398, 9, 1, 6),
        "automobile" => (205, 27, 8, 59),
        "beer-aroma" => (23, 9, 0, 0),
        "blog-feedback" => (52397, 282, 200, 0),
        "cart-artificial" => (40768, 12, 0, 0),
        "communities-and-crime-2" => (2215, 126, 0, 41406),
        "communities-and-crime" => (1994, 124, 0, 36851),
        "computer-hardware" => (209, 10, 1, 0),
        "concrete-slump-test-compressive" => (103, 9, 0, 0),
        "concrete-slump-test-flow" => (103, 9, 0, 0),
        "concrete-slump-test-slump" => (103, 9, 0, 0),
        "construction-maintenance" => (33, 6, 0, 0),
        "cpu-act" => (8192, 23, 0, 0),
        "cpu-small" => (8192, 14, 0, 0),
        "diabetes" => (43, 4, 0, 0),
        "elevators" => (8752, 20, 0, 0),
        "forest-fires" => (517, 14, 2, 0),
        "friedman-artificial" => (40768, 12, 0, 0),
        "geographic-origin-music" => (1059, 70, 0, 0),
        "home-mortgage" => (18, 8, 0, 0),
        "housing" => (506, 15, 0, 0),
        "hybrid-price" => (153, 5, 0, 0),
        "immigrant-salaries" => (35, 5, 0, 0),
        "insurance-company-benchmark" => (5822, 87, 0, 0),
        "japan-emmigration" => (45, 7, 0, 0),
        "kin8nm" => (8192, 10, 0, 0),
        "lpga-2008" => (157, 8, 0, 0),
        "lpga-2009" => (146, 13, 0, 0),
        "online-news-popularity" => (39644, 61, 0, 0),
        "parkinsons-telemonitoring-motor" => (5875, 18, 0, 0),
        "parkinsons-telemonitoring-total" => (5875, 18, 0, 0),
        "pyrim" => (74, 29, 0, 0),
        "texas-jan-temp" => (16, 5, 0, 0),
        "triazines" => (186, 62, 0, 0),
        "tv-sales" => (31, 10, 0, 0),
        "vote-for-clinton" => (2704, 11, 0, 0),
        "wiki4he" => (913, 54, 8, 1995),
        "wine-quality-red" => (1599, 13, 0, 0),
        "wine-quality-white" => (4898, 13, 0, 0),
        "yacht-hydrodynamics" => (308, 8, 0, 0),
        "year-prediction-msd" => (515345, 92, 0, 0),
    ),
)

@testset "$datasettype" for datasettype in UCIData.list_dataset_types()
  @testset "$dataset" for dataset in UCIData.list_datasets(datasettype)
    df = UCIData.dataset(dataset)
    n_categoric = sum(map(x -> string(x)[1] == 'C', names(df)))
    n_missing = sum(count(ismissing, df[c]) for c in names(df))
    @test (size(df, 1), size(df, 2), n_categoric, n_missing) ==
          expected_sizes[datasettype][dataset]
  end
end
