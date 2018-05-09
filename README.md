# DRCF
Rainfall forecasting is a very important problem in the field of hydrology and meteorology. Especially, short-term rainfall forecasting is closely related to resident's daily life. For example, forecasting the situation of stagnant water on the road, providing weather guidance for the flight, and providing short-term heavy rainfall warning in the city.However, existing solutions achieve low prediction accuracy for short-term rainfall forecasting. Numerical forecasting models can achieve overall accuracy but always perform worth in some short-term conditions. Data-driven approaches always neglect the influences of physical factors in upstream or downstream regions, which lead to the forecasting accuracy fluctuates in different areas. 

Rainfall forecasting is affected by many factors, such as high-altitude physical factors and surface factors.High-altitude physical factors play important roles in the movement of rainfall system. Surface factors on the Earth also cause different rainfall. Difference surface factors represent different factors between region and surrounding area. Therefore, it is very reasonable to forecast rainfall by studying the relations between high-altitude physical factors, surface factors and rainfall. In this project, a Dynamic Regional Combined short-term rainfall forecasting model (DRCF) using Multi-Layer Perceptron (MLP) is proposed. The input of the model includes five high-altitude factors and seven different surface factors. 

When DNN is applied to practical problems, the main difference between different usages lies in the difference of network structure. DRCF is a novel application framework using MLP for rainfall forecasting. A single MLP may be wrong. Then, it could make progress when different MLPs are used at the same time. Consequently, we use several MLPs to forecast rainfall in a region at the same time to improve prediction results. These MLPs have different inputs, but they have the same output target, i.e., rainfall.
At the same time, the parameters of these MLPs are dynamically changed. According to this idea, our DRCP model is mainly composed of three steps, which are described in the following:

1.The data needed is collected and necessary pre-processed. In this step, PCA is mainly used to reduce the dimension of data.
This can save computation resources.

2.The structure of MLP is determined using greedy algorithm, and the optimal parameters of MLP are determined through adjustment algorithm.

3.The range of perception is dynamically adjusted to change the number of MLPs. Finally, several suitable MLPs are used to forecast the rainfall results.
