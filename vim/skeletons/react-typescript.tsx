import React, { FC } from "react";
import styled from "styled-components";

interface Props {}

const NewComponent: FC<Props> = (props) => (
  <>
    <NewComponentWrapper></NewComponentWrapper>
  </>
);

export default NewComponent;
/** NewComponent styled components **/
const NewComponentWrapper = styled.div``;
