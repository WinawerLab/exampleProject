function modelFn = getExampleExpModel()
    modelFn = @(params,data)(params(1) * data.^(params(2)));
end