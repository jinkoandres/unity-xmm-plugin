#include "xmm.h"

class XMMEngineCore {

private:
	xmm::TrainingSet set;
	std::vector<int> freeList;
	xmm::GMM gmm;
	//xmm::HierarchicalHMM hhmm;

public:
	XMMEngineCore() {};
	~XMMEngineCore() {};

	void setNbOfGaussians(int n);
	void train();

	void setLikelihoodWindow(int w);
	void filter(std::vector<float> observation);
	std::vector<double> getLikelihoods();
	std::string getLikeliest();

	int getNbOfModels();
	std::string getModels();
	void setModels(std::string sm);
	void clearModels();

	std::string getTrainingSet();
	void setTrainingSet(std::string sts);
	void clearTrainingSet();
	void clearLabel(std::string label);
	void addPhrase(std::string sp);
	int getSetSize();
};