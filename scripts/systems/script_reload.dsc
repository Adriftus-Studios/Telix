
 # we only want to run one of these ever:
 # - foreach <server.list_scripts>:

reload_scripts:
    type: world
    reload:
        - yaml create id:server.skills_by_level
        - yaml create id:server.equipment
        - yaml create id:server.ore_rates
        - foreach <server.list_scripts>:
            - if <[value].name.starts_with[ability]>:
                - yaml id:server.skills_by_level set <[value].yaml_key[ability_tree]>.<[value].yaml_key[points_to_unlock]>:|:<[value].yaml_key[name]>
            - if <[value].yaml_key[ore]||null> != null:
                - yaml id:server.ore_rates set <[value].yaml_key[ore.block]>.<[value].yaml_key[ore.biome]>.<[value].yaml_key[ore.chance]>:<[value].name>
    events:
        on server start:
        - inject locally reload
        on script reload:
        - inject locally reload

        # - stop
        
        - yaml create id:custom_materials
        - foreach <server.list_material_types> as:material:
            - if <[material].is_block>:
                - yaml id:custom_materials set custom_<[material].name>.type:item
        - yaml id:custom_materials savefile:something/custom_materials.yml