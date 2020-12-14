FROM 0x01be/ninja:build as build

FROM 0x01be/base

COPY --from=build /opt/ninja/ /opt/ninja/

ENV PATH=${PATH}:/opt/ninja/

